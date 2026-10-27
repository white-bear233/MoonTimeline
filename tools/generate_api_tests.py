"""Official OTIO 0.18.1 differential cases. Inputs/outputs are not library-derived."""
import argparse
import json
import math
from pathlib import Path
import opentimelineio as o

assert o.__version__ == '0.18.1'
ROOT=Path(__file__).resolve().parents[1]
CASES=[]
FILES={}
def q(value):return json.dumps(value,ensure_ascii=False)
def wire(value):return o.adapters.write_to_string(value,'otio_json')
def raw(value):return q(json.dumps(value,ensure_ascii=False,separators=(',',':')))
def num(value):
    value=float(value)
    if math.isnan(value):return '(0.0/0.0)'
    if math.isinf(value):return '(-1.0/0.0)' if value<0 else '(1.0/0.0)'
    text=repr(value)
    if 'e' in text and '.' not in text.split('e')[0]:text=text.replace('e','.0e')
    return text
def rt(value):return f'@opentime.RationalTime::new(value={num(value.value)},rate={num(value.rate)})'
def tr(value):return f'@opentime.TimeRange::new(start_time={rt(value.start_time)},duration={rt(value.duration)})'
def tt(value):return f'@opentime.TimeTransform::new(offset={rt(value.offset)},scale={num(value.scale)},rate={num(value.rate)})'
def checktime(expr,value):return [f'let actual = {expr}',f'api_number(actual.value,{num(value.value)})',f'api_number(actual.rate,{num(value.rate)})']
def checkrange(expr,value):return [f'let actual_range = {expr}',*checktime('actual_range.start_time',value.start_time),*checktime('actual_range.duration',value.duration)]
def emit(group,label,apis,kind,body):
    key=f'{group}:{label}'
    assert not any(c['id']==key for c in CASES),key
    CASES.append({'id':key,'apis':apis,'kind':kind,'file':f'conformance/api_{group}_test.mbt'})
    FILES.setdefault(group,['// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.'])
    FILES[group]+=['','///|',f'test {q(key)} {{',*['  '+line for line in body],'}']
def objects():
    namespaces=[o.core,o.schema,o.adapters,o.plugins,o.hooks,o.media_linker,o.schemadef]
    for name in sorted(o.core.type_version_map()):
        if name in ['Test','UnknownSchema','PluginManifest']:continue
        cls=next(getattr(ns,name) for ns in namespaces if hasattr(ns,name))
        yield name,cls()
    yield 'PluginManifest',o.plugins.manifest.Manifest()
    for name,cls in [('RationalTime',o.opentime.RationalTime),('TimeRange',o.opentime.TimeRange),('TimeTransform',o.opentime.TimeTransform),('V2d',o.schema.V2d),('Box2d',o.schema.Box2d),('Color',o.core.Color)]:yield name,cls()
def schema_cases():
    variants=[('null',None),('bool',True),('number',1),('string','sample'),('array',[]),('object',{})]
    for name,obj in objects():
        original=json.loads(wire(obj))
        for field in original:
            if field=='OTIO_SCHEMA':continue
            for variant,value in [('missing',None),*variants]:
                changed=dict(original)
                if variant=='missing':del changed[field]
                else:changed[field]=value
                source=json.dumps(changed,ensure_ascii=False)
                body=[f'let result = @schema.read({q(source)})']
                try:expected=json.loads(wire(o.adapters.read_from_string(source,'otio_json')))
                except Exception as error:
                    body+=['assert_true(result is Err(_))']
                    kind='error:'+type(error).__name__
                else:
                    body+=[f'let expected = @otiojson.parse({raw(expected)}).unwrap()',
                           'assert_true(@otiojson.equivalent(result.unwrap().to_json().unwrap(),expected))']
                    kind='boundary' if variant in ['missing','null'] else 'valid'
                emit('fields',f'{name}.{field}.{variant}',[f'{name}.from_json_string',f'{name}.to_json_string',f'{name}.{field}'],kind,body)

def object_cases():
    for name,obj in objects():
        if not isinstance(obj,o.core.SerializableObject):continue
        source=wire(obj)
        body=[f'let obj = @schema.read({q(source)}).unwrap()',f'assert_eq(obj.schema_name(),{q(obj.schema_name())})',f'assert_eq(obj.schema_version(),{obj.schema_version()})',f'assert_eq(obj.is_unknown(),{str(obj.is_unknown_schema).lower()})','let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()',f'assert_eq(obj.equivalent(copy),{str(obj.is_equivalent_to(obj.clone())).lower()})']
        apis=['schema_name','schema_version','is_unknown_schema','is_equivalent_to','clone','deepcopy']
        if hasattr(obj,'name'):
            changed=obj.clone();changed.name='修改 / 🎞️';body+=['let changed = copy.with_name("修改 / 🎞️").unwrap()',f'assert_true(changed.equivalent(@schema.read({q(wire(changed))}).unwrap()))',f'assert_eq(obj.get("name"),Some(@otiojson.parse({raw(obj.name)}).unwrap()))'];apis+=['name']
        if hasattr(obj,'metadata'):
            changed=obj.clone();metadata={'nested':{'values':[1,'注释',True,None]},'user':'original'};changed.metadata.update(metadata)
            body+=[f'let changed = obj.with_metadata(@otiojson.parse({raw(metadata)}).unwrap()).unwrap()',f'assert_true(changed.equivalent(@schema.read({q(wire(changed))}).unwrap()))','assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())'];apis+=['metadata']
        for method in ['visible','overlapping']:
            if hasattr(obj,method):body+=[f'assert_eq(obj.{method}(),{str(getattr(obj,method)()).lower()})'];apis+=[method]
        if hasattr(obj,'is_missing_reference'):
            body+=[f'assert_eq(obj.is_missing_reference(),{str(obj.is_missing_reference).lower()})'];apis+=['is_missing_reference']
        emit('objects',name,[name+'.'+n for n in apis],'valid',body)
        base=[f'let obj = @schema.read({q(source)}).unwrap()']
        for method in ['available_range','trimmed_range','duration','available_image_bounds']:
            if not hasattr(type(obj),method):continue
            if method=='available_range' and isinstance(obj,o.core.MediaReference):continue
            call=f'@graph.{"duration_time" if method=="duration" else method}(obj)'
            check=checked_time if method=='duration' else checked_range
            if method=='available_image_bounds':
                def check(e,v):return [f'assert_true({e} is None)'] if v is None else [f'assert_true(@otiojson.equivalent({e}.unwrap().to_json(),@otiojson.parse({q(wire(v))}).unwrap()))']
            body,status=expected_result(call,lambda:(getattr(obj,method) if method=='available_image_bounds' else getattr(obj,method)()),check)
            emit('objects',name+'-'+method,[name+'.'+method],status,base+body)
    samples=[None,{},1,'invalid',*[json.loads(wire(c())) for c in [o.schema.Clip,o.schema.Gap,o.schema.Marker,o.schema.Effect,o.schema.MissingReference,o.core.SerializableObject]],{'OTIO_SCHEMA':'FutureType.1','custom':42}]
    for name,obj in objects():
        original=json.loads(wire(obj))
        for field in ['children','effects','markers','media_references']:
            if field not in original:continue
            for i,v in enumerate(samples):
                changed=dict(original);changed[field]={'DEFAULT_MEDIA':v} if field=='media_references' else [v]
                source=json.dumps(changed)
                body=[f'let result = @schema.read({q(source)})']
                try:expected=wire(o.adapters.read_from_string(source,'otio_json'))
                except Exception as e:body+=['assert_true(result is Err(_))'];status='error:'+type(e).__name__
                else:body+=[f'assert_true(@otiojson.equivalent(result.unwrap().to_json().unwrap(),@otiojson.parse({q(expected)}).unwrap()))'];status='valid'
                emit('nested',f'{name}-{field}-{i}',[name+'.'+field],status,body)
    original=json.loads(wire(o.schema.ImageSequenceReference()))
    for field in ['start_frame','frame_step','frame_zero_padding']:
        for i,v in enumerate([1.0,1.5,-1,2147483648,9007199254740993,9223372036854775807,9223372036854775808,-9223372036854775809,18446744073709551615,18446744073709551616,math.nan,math.inf]):
            changed=dict(original);changed[field]=v;source=json.dumps(changed)
            body=[f'let result = @schema.read({q(source)})']
            try:expected=wire(o.adapters.read_from_string(source,'otio_json'))
            except Exception as e:body+=['assert_true(result is Err(_))'];status='error:'+type(e).__name__
            else:body+=[f'assert_true(@otiojson.equivalent(result.unwrap().to_json().unwrap(),@otiojson.parse({q(expected)}).unwrap()))'];status='boundary'
            emit('nested',f'integer-{field}-{i}',['ImageSequenceReference.'+field],status,body)
def time_cases():
    R=o.opentime.RationalTime;TR=o.opentime.TimeRange;TT=o.opentime.TimeTransform
    rates=[-1,0,1,24,30,24000/1001,math.inf,math.nan]
    values=[-30.5,-1.5,-0.0,0.5,30.2,1000000000,math.inf,math.nan]
    api=['value','rate','is_valid_time','is_invalid_time','to_seconds','floor','ceil','round','rescaled_to','value_rescaled_to','almost_equal','strictly_equal','duration_from_start_end_time','duration_from_start_end_time_inclusive']
    for i,(value,rate) in enumerate((v,r) for v in values for r in rates):
        t=R(value,rate);body=[f'let t = {rt(t)}',f'assert_eq(t.is_valid_time(),{str(t.is_valid_time()).lower()})',f'assert_eq(t.is_invalid_time(),{str(t.is_invalid_time()).lower()})',f'api_number(t.to_seconds(),{num(t.to_seconds())})']
        for operation in ['floor','ceil','round']:body+=checktime(f't.{operation}()',getattr(t,operation)())
        for r in rates:
            body+=checktime(f't.rescaled_to({num(r)})',t.rescaled_to(r))
            body+=[f'api_number(t.value_rescaled_to({num(r)}),{num(t.value_rescaled_to(r))})']
        for other in [R(50,48),R(0,0),R(1,math.nan)]:
            body+=[f'let other = {rt(other)}']
            for delta in [-1,0,1,math.inf,math.nan]:body+=[f'assert_eq(t.almost_equal(other,delta={num(delta)}),{str(t.almost_equal(other,delta)).lower()})']
            body+=[f'assert_eq(t.strictly_equal(other),{str(t.strictly_equal(other)).lower()})']
            for operation,result in [('equals',t==other),('greater',t>other),('greater_equal',t>=other),('less',t<other),('less_equal',t<=other)]:body+=[f'assert_eq(t.{operation}(other),{str(result).lower()})']
            body+=checktime('t.add(other)',t+other)+checktime('t.subtract(other)',t-other)
            for inclusive in [False,True]:body+=checktime(f'@opentime.duration_from_start_end_time(t,other,inclusive={str(inclusive).lower()})',(R.duration_from_start_end_time_inclusive if inclusive else R.duration_from_start_end_time)(t,other))
        emit('time',str(i),['RationalTime.'+n for n in api],'boundary',body)
    for i,r in enumerate(rates+[-1e9,12,23.98,29.97,59.94,1e9]):
        emit('time',f'rate-{i}',['RationalTime.is_smpte_timecode_rate','RationalTime.nearest_smpte_timecode_rate','RationalTime.is_valid_timecode_rate','RationalTime.nearest_valid_timecode_rate'],'boundary',[f'assert_eq(@opentime.is_smpte_timecode_rate({num(r)}),{str(R.is_smpte_timecode_rate(r)).lower()})',f'api_number(@opentime.nearest_smpte_timecode_rate({num(r)}),{num(R.nearest_smpte_timecode_rate(r))})'])
    for i,v in enumerate([-2147483648,-4.75,-0.5,0,1.9,2147483647]):
        for r in [-1,0,1,24,30]:
            body=checktime(f'@opentime.from_frames({num(v)},{num(r)}).unwrap()',R.from_frames(v,r))+checktime(f'@opentime.from_seconds({num(v)},rate={num(r)})',R.from_seconds(v,r))
            body+=[f'assert_eq({rt(R(v,r))}.to_frames().unwrap(),{R(v,r).to_frames()})']
            emit('time',f'frames-{i}-{r}',['RationalTime.from_frames','RationalTime.from_seconds','RationalTime.to_frames'],'boundary',body)
    ranges=[TR(R(s,rate),R(d,drate)) for s,d,rate,drate in [(0,0,24,24),(10,1,24,24),(10,1.5,24,24),(10,25,24,30),(-10,48,24,48),(0,-3,24,24),(0,1,0,24),(0,1,24,-1)]]
    for i,a in enumerate(ranges):
        body=[f'let a = {tr(a)}',f'assert_eq(a.is_valid_range(),{str(a.is_valid_range()).lower()})',f'assert_eq(a.is_invalid_range(),{str(a.is_invalid_range()).lower()})']
        body+=checktime('a.end_time_exclusive()',a.end_time_exclusive())+checktime('a.end_time_inclusive()',a.end_time_inclusive())
        for d in [R(-50,30),R(24,24)]:body+=checkrange(f'a.duration_extended_by({rt(d)})',a.duration_extended_by(d))
        for b in ranges[:5]:
            body+=[f'let b = {tr(b)}']
            body+=checkrange('a.extended_by(b)',a.extended_by(b))+checkrange('a.clamp_range(b)',a.clamped(b))
            for epsilon in [-1,0,1/384000,0.1,math.nan]:
                for method in ['contains','overlaps','before','meets','begins','finishes','intersects']:
                    body+=[f'assert_eq(a.relates(b,@range.{method.capitalize()},epsilon={num(epsilon)}),{str(getattr(a,method)(b,epsilon)).lower()})']
            for t in [b.start_time,b.end_time_exclusive()]:
                body+=checktime(f'a.clamp_time({rt(t)})',a.clamped(t))
                for method in ['contains','overlaps','before','begins','finishes']:
                    body+=[f'assert_eq(a.relates_time({rt(t)},@range.{method.capitalize()}).unwrap(),{str(getattr(a,method)(t)).lower()})']
            body+=checkrange('@opentime.from_start_end(a.start_time,b.start_time)',TR.range_from_start_end_time(a.start_time,b.start_time))
            body+=checkrange('@opentime.from_start_end(a.start_time,b.start_time,inclusive=true)',TR.range_from_start_end_time_inclusive(a.start_time,b.start_time))
        emit('range',str(i),['TimeRange.'+n for n in ['is_valid_range','is_invalid_range','end_time_exclusive','end_time_inclusive','duration_extended_by','extended_by','clamped','contains','overlaps','before','meets','begins','finishes','intersects','range_from_start_end_time','range_from_start_end_time_inclusive']],'boundary',body)
    for i,(scale,rate) in enumerate((s,r) for s in [-2,0,0.5,2,math.inf,math.nan] for r in [-1,0,24,60]):
        transform=TT(R(12,24),scale,rate);body=[f'let t = {tt(transform)}']
        for t in [R(50,30),R(3,-1),R(0,0)]:body+=checktime(f't.apply_time({rt(t)})',transform.applied_to(t))
        for r in ranges[:3]:body+=checkrange(f't.apply_range({tr(r)})',transform.applied_to(r))
        other=TT(R(5,30),-1,48);expected=transform.applied_to(other)
        body+=[f'let actual_transform = t.apply_transform({tt(other)})',f'api_number(actual_transform.scale,{num(expected.scale)})',f'api_number(actual_transform.rate,{num(expected.rate)})']+checktime('actual_transform.offset',expected.offset)
        emit('transform',str(i),['TimeTransform.applied_to','TimeTransform.offset','TimeTransform.scale','TimeTransform.rate'],'boundary',body)
def v2(v):return f'(@schema.V2d::from_json(@otiojson.parse({q(wire(v))}).unwrap()).unwrap())'
def checkvector(expr,v):return [f'let vector = {expr}',f'api_number(vector.x,{num(v.x)})',f'api_number(vector.y,{num(v.y)})']
def checkcolor(expr,c):return [f'let color = {expr}',*[f'api_number(color.{k},{num(getattr(c,k))})' for k in 'rgba'],f'assert_eq(color.name,{q(c.name)})']

def spatial_cases():
    V=o.schema.V2d;B=o.schema.Box2d;C=o.core.Color
    vectors=[V(x,y) for x,y in [(0,0),(3,4),(-1,2),(1e308,1e308),(1e-300,1e-300),(math.inf,1),(math.nan,1)]]
    for i,v in enumerate(vectors):
        body=[f'let v = {v2(v)}',f'api_number(v.length(),{num(v.length())})',f'api_number(v.length_squared(),{num(v.length2())})']
        for method,expr in [('normalized','v.normalized().unwrap()'),('normalizedNonNull','v.normalized_non_null()'),('normalizedExc','v.normalized(reject_zero=true).unwrap()')]:
            try:expected=getattr(v,method)()
            except ValueError:body+=['assert_true(v.normalized(reject_zero=true) is Err(_))']
            else:body+=checkvector(expr,expected)
        for b in vectors[:3]:
            body+=[f'let b = {v2(b)}',f'api_number(v.dot(b),{num(v.dot(b))})',f'api_number(v.cross(b),{num(v.cross(b))})']
            body+=checkvector('v.add(b)',v+b)+checkvector('v.subtract(b)',v-b)+checkvector('v.multiply_components(b)',v*b)
            for eps in [-1,0,0.1,math.inf,math.nan]:
                body+=[f'assert_eq(v.equal_with_error(b,{num(eps)}),{str(v.equalWithAbsError(b,eps)).lower()})',f'assert_eq(v.equal_with_error(b,{num(eps)},relative=true),{str(v.equalWithRelError(b,eps)).lower()})']
        emit('spatial',f'vector-{i}',['V2d.'+n for n in ['x','y','length','length2','dot','cross','normalized','normalizedExc','normalizedNonNull','equalWithAbsError','equalWithRelError']],'boundary',body)
    limitnames=['baseTypeLowest','baseTypeMax','baseTypeSmallest','baseTypeEpsilon']
    emit('spatial','limits',['V2d.'+n for n in limitnames+['dimensions']],'valid',['let (low,high,small,epsilon,dimensions) = @schema.vector_limits()',*[f'api_number({var},{num(getattr(V,name)())})' for var,name in zip(['low','high','small','epsilon'],limitnames)],f'assert_eq(dimensions,{V.dimensions()})'])
    boxes=[B(V(a,b),V(c,d)) for a,b,c,d in [(0,0,0,0),(-1,-2,3,4),(3,4,-1,-2)]]
    for i,box in enumerate(boxes):
        body=[f'let b = @schema.Box2d::from_json(@otiojson.parse({q(wire(box))}).unwrap()).unwrap()']+checkvector('b.center()',box.center())
        for v in vectors[:3]:
            expected=B(box.min,box.max);expected.extendBy(v)
            body+=[f'assert_eq(b.contains({v2(v)}),{str(box.intersects(v)).lower()})',f'let extended = b.extended_by_point({v2(v)})']+checkvector('extended.min',expected.min)+checkvector('extended.max',expected.max)
        for other in boxes:
            expected=B(box.min,box.max);expected.extendBy(other)
            body+=[f'let other = @schema.Box2d::from_json(@otiojson.parse({q(wire(other))}).unwrap()).unwrap()',f'assert_eq(b.intersects(other),{str(box.intersects(other)).lower()})','let extended = b.extended_by(other)']+checkvector('extended.min',expected.min)+checkvector('extended.max',expected.max)
        emit('spatial',f'box-{i}',['Box2d.'+n for n in ['center','extendBy','intersects','min','max']],'boundary',body)
    for name in [n for n in dir(C) if n.isupper()]:
        emit('spatial',f'color-{name}',[f'Color.{name}'],'valid',checkcolor(f'@schema.Color::named({q(name)}).unwrap()',getattr(C,name)))
    for i,text in enumerate(['','#','0','ff','fff','ffff','112233','11223344','#abcd','0Xff00ff','0x#fff','g00','1z2233',' 12233','+12233','-12233','FfAa09','12345','1234567','123456789']):
        body=[f'let result = @schema.Color::from_hex({q(text)})'];kind='valid'
        try:c=C.from_hex(text)
        except ValueError:body+=['assert_true(result is Err(_))'];kind='error:ValueError'
        else:body+=checkcolor('result.unwrap()',c)
        emit('spatial',f'hex-{i}',['Color.from_hex'],kind,body)
    for i,channels in enumerate([[],[1],[1,2],[0,127,255],[1,2,3,4],[1,2,3,4,5],[-1,256,999]]):
        for depth in [-1,0,1,8,16]:
            expr=f'@schema.Color::from_int_list({json.dumps(channels)},bit_depth={depth})'
            try:c=C.from_int_list(channels,depth)
            except ValueError:body=[f'assert_true({expr} is Err(_))'];kind='error:ValueError'
            else:body=checkcolor(expr+'.unwrap()',c);kind='boundary'
            emit('spatial',f'int-{i}-{depth}',['Color.from_int_list'],kind,body)
    for i,channels in enumerate([[],[1],[1,2],[0,.5,1],[1,2,3,4],[1,2,3,4,5],[-1,2,3],[math.inf,math.nan,0]]):
        expr=f'@schema.Color::from_float_list([{",".join(num(v) for v in channels)}])'
        try:c=C.from_float_list(channels)
        except ValueError:body=[f'assert_true({expr} is Err(_))'];kind='error:ValueError'
        else:
            body=checkcolor(expr+'.unwrap()',c);kind='boundary'
            body+=['let channels = color.to_float_list()',*[f'api_number(channels[{j}],{num(n)})' for j,n in enumerate(c.to_rgba_float_list())]]
            if all(math.isfinite(n) for n in channels):
                body+=[f'assert_eq(color.to_hex().unwrap(),{q(c.to_hex())})']
                for depth in [-1,0,1,8,16]:body+=[f'assert_eq(color.to_int_list(bit_depth={depth}).unwrap(),{json.dumps(c.to_rgba_int_list(depth))})']
        emit('spatial',f'float-{i}',['Color.from_float_list','Color.to_rgba_float_list','Color.to_rgba_int_list','Color.to_hex'],'boundary',body)
    for n in [0,1,0x12345678,0xffffffff]:
        c=C.from_agbr_int(n)
        emit('spatial',f'agbr-{n}',['Color.from_agbr_int','Color.to_agbr_integer'],'boundary',checkcolor(f'@schema.Color::from_agbr_integer({n}U)',c)+[f'assert_eq(color.to_agbr_integer().unwrap(),{c.to_agbr_integer()}U)'])

def codec_cases():
    R=o.opentime.RationalTime
    rates=[12,23.976,24000/1001,24,25,29.97,30000/1001,30,48,50,59.94,60000/1001,60,120]
    for i,(value,rate) in enumerate((v,r) for v in [-1,-0.5,0,1,23.75,1800,18000,2073601] for r in rates):
        t=R(value,rate);body=[f'let t = {rt(t)}']
        for method in ['to_timecode','to_nearest_timecode']:
            for drop in [None,False,True]:
                call=f't.{method}(drop_frame={"None" if drop is None else "Some("+str(drop).lower()+")"})'
                try:result=getattr(t,method)(rate,drop)
                except ValueError:body+=[f'assert_true({call} is Err(_))']
                else:body+=[f'assert_eq({call}.unwrap(),{q(result)})']
        body+=[f'assert_eq(t.to_time_string().unwrap(),{q(t.to_time_string())})']
        emit('codecs',str(i),['RationalTime.to_timecode','RationalTime.to_nearest_timecode','RationalTime.to_time_string'],'boundary',body)
    for method,inputs in [('from_timecode',['','garbage','00:00:00:00','00:01:00;00','00:01:00;02','01:02:03:04','99:99:99:99','-01:00:00:00','1:2:3:4','00:00:00.00','00:00:00:24']),('from_time_string',['','garbage','0','1.5','01:02','01:02:03.456','-01:00:00','99:99:99','00:00:60','1:2:3','00:00:00.0000001'])]:
        for i,(text,rate) in enumerate((t,r) for t in inputs for r in [0,-1,24,29.97,60]):
            call=f'@opentime.{method}({q(text)},{num(rate)})'
            try:expected=getattr(R,method)(text,rate)
            except ValueError:body=[f'assert_true({call} is Err(_))'];kind='error:ValueError'
            else:body=checktime(call+'.unwrap()',expected);kind='valid'
            emit('codecs',f'{method}-{i}',[f'RationalTime.{method}'],kind,body)

def strict_rt(t):return f'@time.RationalTime::new({num(t.value)},{num(t.rate)}).unwrap()'
def strict_tr(r):return f'@range.TimeRange::new({strict_rt(r.start_time)},{strict_rt(r.duration)}).unwrap()'
def checked_time(expr,t):return [f'let actual_time = {expr}',f'api_number(actual_time.value(),{num(t.value)})',f'api_number(actual_time.rate(),{num(t.rate)})']
def checked_range(expr,r):return [f'let result_range = {expr}',*checked_time('result_range.start()',r.start_time),*checked_time('result_range.duration()',r.duration)]
def expected_result(call,fn,check):
    try:expected=fn()
    except Exception as e:return [f'assert_true({call} is Err(_))'], 'error:'+type(e).__name__
    return check(call+'.unwrap()',expected),'valid'

def graph_cases():
    R=o.opentime.RationalTime;TR=o.opentime.TimeRange
    def clip(n,d,rate):return o.schema.Clip(name=n,source_range=TR(R(100,rate),R(d,rate)),media_reference=o.schema.ExternalReference(target_url=n,available_range=TR(R(0,rate),R(1000,rate))))
    def transition():return o.schema.Transition(in_offset=R(2,24),out_offset=R(3,30))
    examples=[[],[clip('a',24,24)],[clip('a',24,24),clip('b',30,30)],[clip('a',24,24),transition(),clip('b',30,30)],[transition(),clip('a',24,24)],[clip('a',24,24),transition()],[clip('a',0,24),clip('b',30,30)],[o.schema.Clip()], [o.schema.Gap()]]
    for kind in ['Track','Stack']:
        for i,kids in enumerate(examples):
            for trimmed in [False,True]:
                obj=getattr(o.schema,kind)(children=[c.deepcopy() for c in kids],source_range=TR(R(6,24),R(12,24)) if trimmed else None)
                base=[f'let object = @schema.read({q(wire(obj))}).unwrap()','let g = @graph.Graph::new(object); ignore(g)']
                for method in ['available_range','trimmed_range','visible_range']:
                    call='g.visible_range([])' if method=='visible_range' else f'@graph.{method}(object)'
                    body,status=expected_result(call,getattr(obj,method),checked_range)
                    emit('graph',f'{kind}-{i}-{trimmed}-{method}',[kind+'.'+method],status,base+body)
                for j in range(-len(kids)-1,len(kids)+1):
                    body,status=expected_result(f'@graph.range_of_child(object,{j})',lambda:obj.range_of_child_at_index(j),checked_range)
                    emit('graph',f'{kind}-{i}-{trimmed}-index-{j}',[kind+'.range_of_child_at_index'],status,base+body)
                for j,child in enumerate(obj):
                    if hasattr(child,'transformed_time') and child.schema_name()!='Transition':
                        for target_index,target in [(-1,obj),*[(k,c) for k,c in enumerate(obj) if c.schema_name()!='Transition']]:
                            target_path=[] if target_index==-1 else [target_index]
                            t=R(120,24)
                            body,status=expected_result(f'g.transformed_time({strict_rt(t)},[{j}],{json.dumps(target_path)})',lambda:child.transformed_time(t,target),checked_time)
                            emit('graph',f'{kind}-{i}-{trimmed}-{j}-transform-{target_index}',[child.schema_name()+'.transformed_time'],status,base+body)
                    for method,call in [('range_in_parent',f'g.range_in_parent([{j}])'),('trimmed_range_in_parent',f'g.range_in_parent([{j}],trimmed=true)'),('visible_range',f'g.visible_range([{j}])')]:
                        if not hasattr(child,method):continue
                        def check(expr,r):return [f'assert_true({expr} is None)'] if r is None else checked_range(expr if method=='visible_range' else expr+'.unwrap()',r)
                        body,status=expected_result(call,getattr(child,method),check)
                        emit('graph',f'{kind}-{i}-{trimmed}-{j}-{method}',[child.schema_name()+'.'+method],status,base+body)
                def checkall(expr,m):
                    body=[f'let ranges={expr}',f'assert_eq(ranges.length(),{len(obj)})']
                    for j,child in enumerate(obj):body+=checked_range(f'ranges[{j}].unwrap()',m[child])
                    return body
                body,status=expected_result('g.ranges_of_all_children([])',obj.range_of_all_children,checkall)
                emit('graph',f'{kind}-{i}-{trimmed}-ranges',[kind+'.range_of_all_children'],status,base+body)
                for n in [-1,0,6,12,23,24,25,47,48]:
                    t=R(n,24)
                    def checkpath(expr,child):return [f'assert_eq({expr},{"None" if child is None else "Some(["+str(list(obj).index(child))+"])"})']
                    body,status=expected_result(f'g.child_at_time([],{strict_rt(t)},shallow=true)',lambda:obj.child_at_time(t,shallow_search=True),checkpath)
                    emit('graph',f'{kind}-{i}-{trimmed}-at-{n}',[kind+'.child_at_time'],status,base+body)
                    for d in [0,1,12]:
                        r=TR(t,R(d,24))
                        def checkpaths(expr,children):return [f'assert_eq({expr},{json.dumps([[list(obj).index(c)] for c in children])})']
                        body,status=expected_result(f'g.children_in_range([],{strict_tr(r)})',lambda:obj.children_in_range(r),checkpaths)
                        emit('graph',f'{kind}-{i}-{trimmed}-range-{n}-{d}',[kind+'.children_in_range'],status,base+body)

def image_cases():
    R=o.opentime.RationalTime;TR=o.opentime.TimeRange
    for i,(start,step,rate,duration,arate) in enumerate([(1,1,24,10,24),(-5,2,24,10,24),(1001,3,30,11,24),(0,1,24,0,24)]):
        obj=o.schema.ImageSequenceReference(target_url_base='file:///images',name_prefix='shot.',name_suffix='.exr',start_frame=start,frame_step=step,rate=rate,frame_zero_padding=4,available_range=TR(R(48,24),R(duration,arate)))
        base=[f'let s = @schema.ImageSequence::from_object(@schema.read({q(wire(obj))}).unwrap()).unwrap()']
        body=[f'assert_eq(s.abstract_target_url("#"),{q(obj.abstract_target_url("#"))})',f'assert_eq(s.number_of_images(),{obj.number_of_images_in_sequence()})',f'api_number(s.end_frame().unwrap(),{num(obj.end_frame())})']
        emit('image',f'{i}-info',['ImageSequenceReference.'+n for n in ['abstract_target_url','number_of_images_in_sequence','end_frame']],'valid',base+body)
        for j in [-1,0,1,obj.number_of_images_in_sequence()-1,obj.number_of_images_in_sequence(),100]:
            for method,moon,check in [('target_url_for_image_number','target_url',lambda e,v:[f'assert_eq({e},{q(v)})']),('presentation_time_for_image_number','presentation_time',checked_time)]:
                body,status=expected_result(f's.{moon}({j})',lambda:getattr(obj,method)(j),check)
                key=f'{i}-{method}-{j}'
                if not any(c['id']=='image:'+key for c in CASES):emit('image',key,['ImageSequenceReference.'+method],status,base+body)
        for n in [47,48,48.5,49,50,57,58,60]:
            t=R(n,24)
            body,status=expected_result(f's.frame_for_time({strict_rt(t)})',lambda:obj.frame_for_time(t),lambda e,v:[f'api_number({e},{num(v)})'])
            emit('image',f'{i}-frame-{n}',['ImageSequenceReference.frame_for_time'],status,base+body)
            r=TR(t,R(1,24))
            body,status=expected_result(f's.frame_range({strict_tr(r)})',lambda:obj.frame_range_for_time_range(r),lambda e,v:[f'let (a,b)={e}',f'api_number(a,{num(v[0])})',f'api_number(b,{num(v[1])})'])
            emit('image',f'{i}-range-{n}',['ImageSequenceReference.frame_range_for_time_range'],status,base+body)

def algorithm_cases():
    R=o.opentime.RationalTime;TR=o.opentime.TimeRange
    def clip(name,start,d,rate=24):return o.schema.Clip(name=name,source_range=TR(R(start,rate),R(d,rate)),metadata={'nested':{'keep':[1,'标记']}},markers=[o.schema.Marker(name='keep',marked_range=TR(R(start,rate),R(1,rate)))])
    def checkobj(expr,obj):return [f'assert_true({expr}.equivalent(@schema.read({q(wire(obj))}).unwrap()))']
    for position in ['middle','head','tail','adjacent','only']:
        for offset in [0,2,30]:
            transition=o.schema.Transition(in_offset=R(offset,24),out_offset=R(offset,30))
            a=clip('a',100,24);b=clip('b',50,30,30)
            children={'middle':[a,transition,b],'head':[transition,b],'tail':[a,transition],'adjacent':[a,transition,transition.deepcopy(),b],'only':[transition]}[position]
            track=o.schema.Track(children=children)
            call=f'@algorithms.track_with_expanded_transitions(@schema.read({q(wire(track))}).unwrap())'
            def checkexpanded(expr,items):
                body=[f'let items = {expr}',f'assert_eq(items.length(),{len(items)})']
                for j,item in enumerate(items):
                    if isinstance(item,tuple):
                        body+=[f'let (a,t,b) = match items[{j}] {{ @algorithms.Transition(a,t,b) => (a,t,b); _ => fail("expected transition") }}']
                        for var,obj in zip(['a','t','b'],item):body+=checkobj(var,obj)
                    else:body+=[f'let item = match items[{j}] {{ @algorithms.Item(item) => item; _ => fail("expected item") }}']+checkobj('item',item)
                return body
            body,status=expected_result(call,lambda:o.algorithms.track_with_expanded_transitions(track),checkexpanded)
            emit('algorithms',f'expand-{position}-{offset}',['algorithms.track_with_expanded_transitions'],status,body)
    for i in range(5):
        track=o.schema.Track(children=[clip('a',100,24),o.schema.Gap(source_range=TR(R(0,24),R(6,24))),clip('b',50,30,30)])
        if i==1:track.insert(1,o.schema.Transition(in_offset=R(2,24),out_offset=R(3,24)))
        if i==2:track.source_range=TR(R(4,24),R(10,24))
        if i==3:track[0].enabled=False
        if i==4:track.enabled=False
        timeline=o.schema.Timeline(tracks=[track])
        for method,obj in [('track_trimmed_to_range',track),('timeline_trimmed_to_range',timeline)]:
            for j,(start,d) in enumerate([(-10,10),(0,0),(0,1),(0,24),(12,24),(30,24),(50,100),(100,10)]):
                bounds=TR(R(start,24),R(d,24))
                call=f'@algorithms.{method}(@schema.read({q(wire(obj))}).unwrap(),{strict_tr(bounds)})'
                body,status=expected_result(call,lambda:getattr(o.algorithms,method)(obj,bounds),checkobj)
                emit('algorithms',f'{i}-{method}-{j}', ['algorithms.'+method],status,body)
        stack=o.schema.Stack(children=[o.schema.Track(children=[clip('bottom',0,120)]),track.deepcopy()])
        for n in [-1,0,23,24,25,30,50,119,120]:
            t=R(n,24)
            call=f'@algorithms.top_clip_at_time(@schema.read({q(wire(stack))}).unwrap(),{strict_rt(t)})'
            body,status=expected_result(call,lambda:o.algorithms.top_clip_at_time(stack,t),lambda e,v:[f'assert_true({e} is None)'] if v is None else checkobj(e+'.unwrap()',v))
            emit('algorithms',f'{i}-top-{n}',['algorithms.top_clip_at_time'],status,body)
        call=f'@algorithms.flatten_stack(@schema.read({q(wire(stack))}).unwrap())'
        body,status=expected_result(call,lambda:o.algorithms.flatten_stack(stack),checkobj)
        emit('algorithms',f'{i}-flatten',['algorithms.flatten_stack'],status,body)
        for prune in [[],['Gap'],['Clip'],['Track']]:
            for context in [False,True]:
                name='filtered_with_sequence_context' if context else 'filtered_composition'
                def fn(previous,node,next):
                    node.name += ':visited'
                    return node
                expected=getattr(o.algorithms,name)(timeline,fn if context else lambda n:fn(None,n,None),types_to_prune=[getattr(o.schema,n) for n in prune])
                closure='fn(_previous,node,_next)' if context else 'fn(node)'
                call=f'@algorithms.{name}(@schema.read({q(wire(timeline))}).unwrap(),{closure} {{Ok([node.with_name(node.name().unwrap()+":visited").unwrap()])}},prune={json.dumps(prune)}).unwrap()'
                body=[f'let result = {call}']+([f'assert_eq(result.length(),0)'] if expected is None else checkobj('result[0]',expected))
                emit('algorithms',f'{i}-{name}-{prune}', ['algorithms.'+name],'valid',body)

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--group',default='all',choices=['all','fields','objects','time','spatial','codecs','graph','image','algorithms']);args=parser.parse_args()
    if args.group in ['fields','all']:schema_cases()
    if args.group in ['objects','all']:object_cases()
    if args.group in ['time','all']:time_cases()
    if args.group in ['spatial','all']:spatial_cases()
    if args.group in ['codecs','all']:codec_cases()
    if args.group in ['graph','all']:graph_cases()
    if args.group in ['image','all']:image_cases()
    if args.group in ['algorithms','all']:algorithm_cases()
    for group,lines in FILES.items():
        (ROOT/f'conformance/api_{group}_test.mbt').write_text('\n'.join(lines)+'\n',encoding='utf-8',newline='\n')
    if args.group != 'all':
        print(f'Generated {len(CASES)} differential cases for {args.group}; full coverage ledger unchanged')
        return
    (ROOT/'docs/api-conformance-cases.json').write_text(json.dumps({'upstream':'0.18.1','cases':CASES},ensure_ascii=False,indent=2)+'\n',encoding='utf-8',newline='\n')
    inventory=json.loads((ROOT/'docs/otio-api-inventory.json').read_text(encoding='utf-8'))
    index={}
    for case in CASES:
        for api in case['apis']:index.setdefault(api,[]).append(case['id'])
    members=[]
    for cls,names in inventory['classes'].items():
        for name in names:
            key=cls.split('.')[-1]+'.'+name
            ids=index.get(key,[])
            host_file = name in ['from_json_file','to_json_file']
            entry={'upstream':cls+'.'+name,'case_ids':ids,'status':'cases_present' if ids else 'host_roundtrip_cases_present' if host_file else 'not_covered_by_this_generator'}
            if host_file:entry['host_test']='tools/check_api_files.py'
            members.append(entry)
    for name in inventory['algorithms']:
        key='algorithms.'+name;ids=index.get(key,[])
        members.append({'upstream':key,'case_ids':ids,'status':'cases_present' if ids else 'not_covered_by_this_generator'})
    coverage={'upstream':'0.18.1','meaning':'Case links, not a complete compatibility certification. Field wire tests do not prove Python setter, identity or host behavior. Exceptions currently compare success versus Result error, not Python exception class/message. Existing legacy tests are separate.','members':members}
    (ROOT/'docs/api-conformance-coverage.json').write_text(json.dumps(coverage,ensure_ascii=False,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'Generated {len(CASES)} differential cases')
if __name__=='__main__':main()
