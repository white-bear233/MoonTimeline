"""Official OTIO 0.18.1 differential cases. Inputs/outputs are not library-derived."""
import argparse
import json
import math
import time as system_time
import tempfile
import types
import os
import inspect
import posixpath
import ntpath
import nturl2path
import urllib.parse
import io
from unittest.mock import patch
from pathlib import Path
import opentimelineio as o

assert o.__version__ == '0.18.1'
ROOT=Path(__file__).resolve().parents[1]
CASES=[]
FILES={}

def write_generated(path,text):
    # Replace atomically: Windows indexers can briefly hold a generated file.
    # A failed generation must not leave a truncated checked-in fixture.
    temporary=path.with_suffix(path.suffix+'.tmp')
    temporary.write_text(text,encoding='utf-8',newline='\n')
    for attempt in range(6):
        try:
            temporary.replace(path)
            return
        except OSError:
            if attempt==5:raise
            system_time.sleep(0.1)
def q(value):return json.dumps(value,ensure_ascii=False)
def wire(value):return o.core.serialize_json_to_string(value)
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
        body+=['assert_true(@schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj))']
        apis=['schema_name','schema_version','is_unknown_schema','is_equivalent_to','clone','deepcopy','from_json_string','to_json_string']
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
        for method,call in [('normalize','v.normalized()'),('normalizeExc','v.normalized(reject_zero=true)'),('normalizeNonNull','Ok(v.normalized_non_null())')]:
            changed=V(v.x,v.y)
            try:getattr(changed,method)()
            except ValueError:body=[f'let v={v2(v)}',f'assert_true({call} is Err(_))'];status='error:ValueError'
            else:body=[f'let v={v2(v)}']+checkvector('v.normalized_non_null()' if method=='normalizeNonNull' else call+'.unwrap()',changed);status='adapted:value_normalization'
            emit('spatial',f'{method}-{i}',['V2d.'+method],status,body)
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
    for kind in ['Track','Stack','Composition']:
        for i,kids in enumerate(examples):
            for trimmed in [False,True]:
                cls=getattr(o.schema,kind,None) or getattr(o.core,kind)
                obj=cls(children=[c.deepcopy() for c in kids],source_range=TR(R(6,24),R(12,24)) if trimmed else None)
                base=[f'let object = @schema.read({q(wire(obj))}).unwrap()','let g = @graph.Graph::new(object); ignore(g)']
                for method in ['available_range','trimmed_range','visible_range']:
                    call='g.visible_range([])' if method=='visible_range' else f'@graph.{method}(object)'
                    body,status=expected_result(call,getattr(obj,method),checked_range)
                    emit('graph',f'{kind}-{i}-{trimmed}-{method}',[kind+'.'+method],status,base+body)
                for j in range(-len(kids)-1,len(kids)+1):
                    body,status=expected_result(f'@graph.range_of_child(object,{j})',lambda:obj.range_of_child_at_index(j),checked_range)
                    emit('graph',f'{kind}-{i}-{trimmed}-index-{j}',[kind+'.range_of_child_at_index'],status,base+body)
                    body,status=expected_result(f'@graph.trimmed_range_of_child_at_index(object,{j})',lambda:obj.trimmed_range_of_child_at_index(j),checked_range)
                    emit('graph',f'{kind}-{i}-{trimmed}-trim-index-{j}',[kind+'.trimmed_range_of_child_at_index'],status,base+body)
                for j,child in enumerate(obj):
                    if kind=='Track':
                        for gaps in [False,True]:
                            neighbors=obj.neighbors_of(child,o.schema.NeighborGapPolicy.around_transitions if gaps else o.schema.NeighborGapPolicy.never)
                            body=[f'let (left,right) = g.neighbors([{j}],insert_gaps={str(gaps).lower()}).unwrap()']
                            for var,value in zip(['left','right'],neighbors):
                                body+=[f'assert_true({var} is None)'] if value is None else [f'assert_true({var}.unwrap().equivalent(@schema.read({q(wire(value))}).unwrap()))']
                            emit('graph',f'{kind}-{i}-{trimmed}-{j}-neighbors-{gaps}',['Track.neighbors_of','Track.NeighborGapPolicy'],'valid',base+body)
                    def checkhandles(e,handles):
                        body=[f'let (head,tail) = {e}']
                        for var,value in zip(['head','tail'],handles):body+= [f'assert_true({var} is None)'] if value is None else checked_time(var+'.unwrap()',value)
                        return body
                    body,status=expected_result(f'g.handles_time([{j}])',lambda:obj.handles_of_child(child),checkhandles)
                    emit('graph',f'{kind}-{i}-{trimmed}-{j}-handles',[kind+'.handles_of_child'],status,base+body)
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

    clip=o.schema.Clip(name='nested',source_range=TR(R(100,24),R(48,24)))
    track=o.schema.Track(children=[o.schema.Gap(source_range=TR(R(0,30),R(15,30))),clip],source_range=TR(R(3,24),R(36,24)))
    inner=o.schema.Stack(children=[track],source_range=TR(R(6,30),R(30,30)))
    root=o.schema.Track(children=[o.schema.Gap(source_range=TR(R(0,48),R(24,48))),inner])
    nodes=[([],root),([0],root[0]),([1],inner),([1,0],track),([1,0,0],track[0]),([1,0,1],clip)]
    base=[f'let g=@graph.Graph::new(@schema.read({q(wire(root))}).unwrap())']
    for path,child in nodes:
        for parent_path,parent in nodes:
            if not isinstance(parent,o.core.Composition):continue
            for trimmed in [False,True]:
                method='trimmed_range_of_child' if trimmed else 'range_of_child'
                call=f'g.range_of_descendant({json.dumps(path)},{json.dumps(parent_path)},trimmed={str(trimmed).lower()})'
                if not path:
                    # OTIO 0.18.1 dereferences an empty parent path for self;
                    # Windows reference wheel exits with access violation.
                    body,status=[f'assert_true({call} is Err(_))'],'upstream_unsafe:orphan_child_range'
                else:
                    body,status=expected_result(call,lambda:getattr(parent,method)(child),lambda e,r:[f'assert_true({e} is None)'] if r is None else checked_range(e+'.unwrap()',r))
                emit('graph',f'nested-{path}-{parent_path}-{method}',[parent.schema_name()+'.'+method],status,base+body)
            if isinstance(child,o.core.Item):
                t=R(48,24);r=TR(t,R(12,24))
                for method,call,check,arg in [('transformed_time',f'g.transformed_time({strict_rt(t)},{json.dumps(path)},{json.dumps(parent_path)})',checked_time,t),('transformed_time_range',f'g.transformed_range({strict_tr(r)},{json.dumps(path)},{json.dumps(parent_path)})',checked_range,r)]:
                    body,status=expected_result(call,lambda:getattr(child,method)(arg,parent),check)
                    emit('graph',f'nested-{path}-{parent_path}-{method}',[child.schema_name()+'.'+method],status,base+body)

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

def traversal_cases():
    R=o.opentime.RationalTime;TR=o.opentime.TimeRange
    def clip(name):return o.schema.Clip(name=name,source_range=TR(R(100,24),R(24,24)))
    a=clip('a');b=clip('b');gap=o.schema.Gap(name='gap',duration=R(12,24))
    track=o.schema.Track(name='track',children=[a,gap,b],source_range=TR(R(6,24),R(36,24)))
    stack=o.schema.Stack(name='stack',children=[track]);timeline=o.schema.Timeline(name='timeline',tracks=[track.deepcopy()])
    collection=o.schema.SerializableCollection(name='collection',children=[timeline,stack.deepcopy(),clip('loose')])
    for original in [a.deepcopy(),o.core.Composition(children=[clip('abstract-child')]),track,stack,timeline,collection]:
        obj=original.deepcopy()
        name=obj.schema_name();base=[f'let g = @graph.Graph::new(@schema.read({q(wire(obj))}).unwrap())']
        nodes=[]
        def walk(node,path):
            nodes.append((node,path))
            if isinstance(node,o.schema.Timeline):walk(node.tracks,path+[0])
            elif isinstance(node,(o.core.Composition,o.schema.SerializableCollection)):
                for i,c in enumerate(node):walk(c,path+[i])
        walk(obj,[])
        def checkpaths(expr,items):
            paths=[next(p for n,p in nodes if n==item) for item in items]
            return [f'assert_eq({expr},{json.dumps(paths)})']
        for shallow in [False,True]:
            for wi,window in enumerate([None,TR(R(-1,24),R(1,24)),TR(R(0,24),R(0,24)),TR(R(18,24),R(12,24)),TR(R(70,24),R(1,24))]):
                params=f'shallow={str(shallow).lower()},search_range={"None" if window is None else "Some("+strict_tr(window)+")"}'
                body,status=expected_result(f'g.find_clips({params})',lambda:list(obj.find_clips(search_range=window) if isinstance(obj,o.schema.Clip) else obj.find_clips(search_range=window,shallow_search=shallow)),checkpaths)
                emit('traversal',f'{name}-clips-{shallow}-{wi}',[name+'.find_clips'],status,base+body)
                if not hasattr(obj,'find_children'):continue
                for cls in [o.core.SerializableObject,o.core.Item,o.schema.Clip,o.core.Composition]:
                    body,status=expected_result(f'g.find_children(schema={q(cls.__name__)},{params})',lambda:list(obj.find_children(descended_from_type=cls,search_range=window,shallow_search=shallow)),checkpaths)
                    emit('traversal',f'{name}-children-{shallow}-{wi}-{cls.__name__}',[name+'.find_children'],status,base+body)
        if isinstance(obj,o.core.Composition):
            emit('traversal',f'{name}-properties',[name+'.has_clips',name+'.composition_kind'],'valid',base+[f'assert_eq(g.has_clips(),{str(obj.has_clips()).lower()})',f'assert_eq(g.root().composition_kind().unwrap(),{q(obj.composition_kind)})'])
        for child,path in nodes:
            if isinstance(child,o.core.Composable) and not isinstance(obj,(o.schema.Timeline,o.schema.SerializableCollection)):
                parent=child.parent()
                expected=[f'assert_true(g.parent({json.dumps(path)}).unwrap() is None)'] if parent is None else [f'assert_true(g.parent({json.dumps(path)}).unwrap().unwrap().equivalent(@schema.read({q(wire(parent))}).unwrap()))']
                emit('traversal',f'{name}-parent-{path}',[child.schema_name()+'.parent'],'valid',base+expected)
            if isinstance(obj,o.core.Composition):
                emit('traversal',f'{name}-isparent-{path}',[name+'.is_parent_of'],'valid',base+[f'assert_eq(g.is_parent_of([],{json.dumps(path)}).unwrap(),{str(obj.is_parent_of(child)).lower()})'])
    for kind in ['Composition','Track','Stack']:
        cls=getattr(o.schema,kind,None) or getattr(o.core,kind)
        for trimmed in [False,True]:
            obj=cls(source_range=TR(R(6,24),R(12,24)) if trimmed else None)
            for j,r in enumerate([TR(R(0,24),R(0,24)),TR(R(0,30),R(30,30)),TR(R(30,24),R(1,24))]):
                call=f'@graph.trim_child_range(@schema.read({q(wire(obj))}).unwrap(),{strict_tr(r)})'
                body,status=expected_result(call,lambda:obj.trim_child_range(r),lambda e,v:[f'assert_true({e} is None)'] if v is None else checked_range(e+'.unwrap()',v))
                emit('traversal',f'{kind}-trim-child-{trimmed}-{j}',[kind+'.trim_child_range',kind+'.trimmed_child_range'],status,body)
    for cls in [o.core.Composable,o.core.Item,o.core.Composition,o.schema.Track,o.schema.Stack,o.schema.Transition]:
        child=cls(name='node')
        if isinstance(child,o.core.Item):child.source_range=TR(R(10,24),R(20,24))
        parent=o.schema.Track(name='parent',children=[child]);base=[f'let g=@graph.Graph::new(@schema.read({q(wire(parent))}).unwrap())']
        emit('traversal',cls.__name__+'-parent',[cls.__name__+'.parent'],'valid',base+[f'assert_true(g.parent([0]).unwrap().unwrap().equivalent(@schema.read({q(wire(parent))}).unwrap()))'])
        for method in ['range_in_parent','trimmed_range_in_parent','visible_range','transformed_time','transformed_time_range']:
            if not hasattr(child,method):continue
            if method=='transformed_time':
                call=f'g.transformed_time({strict_rt(R(15,24))},[0],[])';oracle=lambda:child.transformed_time(R(15,24),parent);check=checked_time
            elif method=='transformed_time_range':
                r=TR(R(15,24),R(2,24));call=f'g.transformed_range({strict_tr(r)},[0],[])';oracle=lambda:child.transformed_time_range(r,parent);check=checked_range
            elif method=='visible_range':call='g.visible_range([0])';oracle=child.visible_range;check=checked_range
            else:
                call=f'g.range_in_parent([0],trimmed={str(method.startswith("trimmed")).lower()})';oracle=getattr(child,method);check=lambda e,v:checked_range(e+'.unwrap()',v) if v is not None else [f'assert_true({e} is None)']
            body,status=expected_result(call,oracle,check)
            emit('traversal',cls.__name__+'-'+method,[cls.__name__+'.'+method],status,base+body)
    timeline=o.schema.Timeline(tracks=[o.schema.Track(kind='Audio',name='audio'),o.schema.Track(kind='Video',name='video'),o.schema.Track(kind='custom',name='other')])
    base=[f'let g=@graph.Graph::new(@schema.read({q(wire(timeline))}).unwrap())']
    for kind,method in [('Audio','audio_tracks'),('Video','video_tracks')]:
        expected=list(getattr(timeline,method)());body=[f'let found=g.tracks({q(kind)}).unwrap()',f'assert_eq(found.length(),{len(expected)})']
        for j,v in enumerate(expected):body+=[f'assert_true(found[{j}].equivalent(@schema.read({q(wire(v))}).unwrap()))']
        emit('traversal','timeline-'+method,['Timeline.'+method],'valid',base+body)
    for j,child in enumerate(timeline.tracks):
        body=checked_range(f'g.range_of_descendant([0,{j}],[0]).unwrap().unwrap()',timeline.range_of_child(child))
        emit('traversal',f'timeline-range-{j}',['Timeline.range_of_child'],'adapted:timeline_tracks_path',base+body)

def collection_cases():
    for cls in [o.core.Composition,o.schema.Track,o.schema.Stack,o.schema.SerializableCollection]:
        name=cls.__name__;original=cls(name='keep',children=[o.schema.Clip(name='a'),o.schema.Gap(name='gap'),o.schema.Clip(name='b')],metadata={'keep':{'nested':[1,2,3]}})
        base=[f'let original=@schema.read({q(wire(original))}).unwrap()','let g=@graph.Graph::new(original)']
        for index in [0,1,2,9]:
            target=original[index] if index<3 else o.schema.Clip(name='foreign')
            body=[f'assert_eq(g.count_child([],[{index}]).unwrap(),{original.count(target)})']
            emit('collections',f'{name}-count-{index}',[name+'.count'],'adapted:path_identity',base+body)
            for start,stop in [(0,3),(-2,3),(0,1),(3,3)]:
                call=f'g.index_of_child([],[{index}],start={start},stop=Some({stop}))'
                body,status=expected_result(call,lambda:original.index(target,start,stop),lambda e,v:[f'assert_eq({e},{v})'])
                emit('collections',f'{name}-index-{index}-{start}-{stop}',[name+'.index'],status,base+body)
        if name=='Composition':
            for trimmed in [False,True]:
                method='trimmed_range_of_child' if trimmed else 'range_of_child'
                body,status=expected_result(f'g.range_of_descendant([0],[],trimmed={str(trimmed).lower()})',lambda:getattr(original,method)(original[0]),lambda e,v:checked_range(e+'.unwrap()',v))
                emit('collections',f'{name}-{method}',[name+'.'+method],status,base+body)
        for index in [-10,-3,-1,0,2,3,10]:
            changed=original.deepcopy();changed.insert(index,o.schema.Clip(name='new'))
            call=f'g.insert([],{index},@schema.read({q(wire(o.schema.Clip(name="new")))}).unwrap()).unwrap().root()'
            emit('collections',f'{name}-insert-{index}',[name+'.insert'],'boundary',base+[f'assert_true({call}.equivalent(@schema.read({q(wire(changed))}).unwrap()))',f'assert_true(g.root().equivalent(original))'])
            changed=original.deepcopy()
            try:removed=changed.pop(index)
            except IndexError:body=[f'assert_true(g.pop([],index={index}) is Err(_))'];status='error:IndexError'
            else:body=[f'let (changed,removed)=g.pop([],index={index}).unwrap()',f'assert_true(changed.root().equivalent(@schema.read({q(wire(changed))}).unwrap()))',f'assert_true(removed.equivalent(@schema.read({q(wire(removed))}).unwrap()))'];status='valid'
            emit('collections',f'{name}-pop-{index}',[name+'.pop'],status,base+body)
        for operation in ['append','extend','clear','reverse','remove']:
            changed=original.deepcopy();body=['let children=original.children().unwrap()']
            if operation=='reverse':
                try:changed.reverse()
                except ValueError:body=['assert_true(g.reversed_children([]) is Err(_))'];status='error:ValueError'
                else:body=[f'assert_true(g.reversed_children([]).unwrap().root().equivalent(@schema.read({q(wire(changed))}).unwrap()))'];status='valid'
                emit('collections',f'{name}-{operation}',[name+'.'+operation],status,base+body)
                continue
            if operation=='append':
                changed.append(o.schema.Clip(name='new'));body+=[f'children.push(@schema.read({q(wire(o.schema.Clip(name="new")))}).unwrap())']
            elif operation=='extend':
                changed.extend([o.schema.Clip(name='new'),o.schema.Gap()]);body+=[f'children.push(@schema.read({q(wire(c))}).unwrap())' for c in [o.schema.Clip(name='new'),o.schema.Gap()]]
            elif operation=='clear':changed.clear();body+=['children.clear()']
            else:changed.remove(changed[1]);body+=['children.remove(1) |> ignore']
            body+=[f'assert_true(original.with_children(children).unwrap().equivalent(@schema.read({q(wire(changed))}).unwrap()))']
            emit('collections',f'{name}-{operation}',[name+'.'+operation],'adapted:immutable_array_update',base+['ignore(g)']+body)
        # Dynamic wrong object types are rejected before a replacement is returned.
        for bad in [o.schema.Marker(),o.schema.Effect(),o.schema.MissingReference()]:
            changed=original.deepcopy();call=f'g.insert([],0,@schema.read({q(wire(bad))}).unwrap())'
            try:changed.insert(0,bad)
            except Exception as e:body=[f'assert_true({call} is Err(_))'];status='error:'+type(e).__name__
            else:body=[f'assert_true({call}.unwrap().root().equivalent(@schema.read({q(wire(changed))}).unwrap()))'];status='valid'
            emit('collections',f'{name}-insert-{bad.schema_name()}',[name+'.insert'],status,base+body)

def media_property_cases():
    for i,(refs,key) in enumerate([({},'DEFAULT_MEDIA'),({'':o.schema.MissingReference()},''),({'a':o.schema.MissingReference()},'bad'),({'a':o.schema.MissingReference()},'a'),({'a':None},'a'),({'a':o.schema.ExternalReference(target_url='file:///shot.mov'),'b':o.schema.MissingReference()},'b'),({'a':o.schema.Clip()},'a')]):
        source=o.schema.Clip();changed=source.deepcopy()
        media='{' + ','.join(q(k)+':'+('None' if v is None else 'Some(@schema.read('+q(wire(v))+').unwrap())') for k,v in refs.items())+'}'
        call=f'@schema.Object::new("Clip").unwrap().with_optional_media_references({media},{q(key)})'
        try:changed.set_media_references(refs,key)
        except Exception as e:body=[f'assert_true({call} is Err(_))'];status='error:'+type(e).__name__
        else:
            body=[f'let changed={call}.unwrap()',f'assert_true(changed.equivalent(@schema.read({q(wire(changed))}).unwrap()))',f'assert_true(changed.media_reference().unwrap().unwrap().equivalent(@schema.read({q(wire(changed.media_reference))}).unwrap()))'];status='valid'
        emit('media_properties',f'set-{i}',['Clip.set_media_references','Clip.media_reference'],status,body)
    for key in ['DEFAULT_MEDIA','missing','']:
        data=json.loads(wire(o.schema.Clip()));data['active_media_reference_key']=key
        restored=o.adapters.read_from_string(json.dumps(data))
        body=[f'let c=@schema.read({q(json.dumps(data))}).unwrap()']
        body+=['assert_true(c.media_reference().unwrap() is None)'] if restored.media_reference is None else [f'assert_true(c.media_reference().unwrap().unwrap().equivalent(@schema.read({q(wire(restored.media_reference))}).unwrap()))']
        emit('media_properties',f'get-{key}',['Clip.media_reference'],'boundary',body)
    emit('media_properties','default-key',['Clip.DEFAULT_MEDIA_KEY'],'valid',[f'assert_eq(@schema.Object::new("Clip").unwrap().get("active_media_reference_key"),Some(Json::string({q(o.schema.Clip.DEFAULT_MEDIA_KEY)})))'])
    for name in [n for n in dir(o.schema.Marker.Color) if n.isupper()]:
        value=getattr(o.schema.Marker.Color,name);obj=o.schema.Marker(color=value)
        emit('media_properties','marker-color-'+name,['Marker.Color'],'valid',[f'assert_true(@schema.Object::new("Marker").unwrap().with_field("color",Json::string({q(value)})).unwrap().equivalent(@schema.read({q(wire(obj))}).unwrap()))'])
    for name in ['Audio','Video']:
        value=getattr(o.schema.Track.Kind,name);obj=o.schema.Track(kind=value)
        emit('media_properties','track-kind-'+name,['Track.Kind'],'valid',[f'assert_true(@schema.Object::new("Track").unwrap().with_field("kind",Json::string({q(value)})).unwrap().equivalent(@schema.read({q(wire(obj))}).unwrap()))'])
    for name in ['Custom','SMPTE_Dissolve']:
        value=getattr(o.schema.Transition.Type,name);obj=o.schema.Transition(transition_type=value)
        emit('media_properties','transition-type-'+name,['Transition.Type'],'valid',[f'assert_true(@schema.Object::new("Transition").unwrap().with_field("transition_type",Json::string({q(value)})).unwrap().equivalent(@schema.read({q(wire(obj))}).unwrap()))'])
    for name in ['error','hold','black']:
        obj=o.schema.ImageSequenceReference(missing_frame_policy=getattr(o.schema.ImageSequenceReference.MissingFramePolicy,name))
        emit('media_properties','missing-policy-'+name,['ImageSequenceReference.MissingFramePolicy'],'valid',[f'assert_true(@schema.Object::new("ImageSequenceReference").unwrap().with_field("missing_frame_policy",Json::string({q(name)})).unwrap().equivalent(@schema.read({q(wire(obj))}).unwrap()))'])

def manifest_cases():
    first=o.plugins.manifest.Manifest();second=o.plugins.manifest.Manifest()
    first.adapters=[o.adapters.Adapter('first','first.py',['otio']),o.adapters.Adapter('duplicate','dup.py',['same'])]
    first.schemadefs=[o.schema.SchemaDef('custom','custom.py')]
    first.hooks={'post_adapter_read':['one']};first.version_manifests={'family':{'v1':{'Clip':1}}}
    second.adapters=[o.adapters.Adapter('second','second.py',['same','extra'])];second.hooks={'post_adapter_read':['two'],'pre_adapter_write':['three']};second.version_manifests={'family':{'v2':{'Clip':2}}}
    base=[f'let manifest=@schema.read({q(wire(first))}).unwrap()']
    for value in [None,second]:
        expected=first.deepcopy();expected.extend(value)
        arg='None' if value is None else f'Some(@schema.read({q(wire(value))}).unwrap())'
        emit('plugins',f'extend-{value is None}',['PluginManifest.extend'],'valid',base+[f'assert_true(@plugins.extend_manifest(manifest,{arg}).unwrap().equivalent(@schema.read({q(wire(expected))}).unwrap()))'])
    for name in ['first','custom','missing','']:
        for kind in ['adapters','schemadefs','media_linkers','missing']:
            call=f'@plugins.manifest_from_name(manifest,{q(name)},kind={q(kind)})'
            body,status=expected_result(call,lambda:first.from_name(name,kind),lambda e,v:[f'assert_true({e}.equivalent(@schema.read({q(wire(v))}).unwrap()))'])
            emit('plugins',f'name-{name}-{kind}',['PluginManifest.from_name'],status,base+body)
    combined=first.deepcopy();combined.extend(second)
    base=[f'let manifest=@schema.read({q(wire(combined))}).unwrap()']
    for suffix in ['otio','OTIO','.otio','same','extra','unknown','']:
        call=f'@plugins.manifest_from_suffix(manifest,{q(suffix)})'
        body,status=expected_result(call,lambda:combined.from_filepath(suffix),lambda e,v:[f'assert_true({e}.equivalent(@schema.read({q(wire(v))}).unwrap()))'])
        emit('plugins',f'suffix-{suffix}',['PluginManifest.from_filepath'],status,base+body)

def plugin_pipeline_cases():
    phases=['post_adapter_read','post_media_linker','pre_adapter_write','post_adapter_write']
    original_hook=o.hooks.run
    original_default=os.environ.get('OTIO_DEFAULT_MEDIA_LINKER')
    os.environ.pop('OTIO_DEFAULT_MEDIA_LINKER',None)
    try:
        for action in ['read_from_string','write_to_string','read_from_file','write_to_file']:
            for failure in ['none','read','write',*phases,'file_io']:
                calls=[]
                def event(name):
                    calls.append(name)
                    if name==failure:raise ValueError('fixture failure')
                def read_from_string(input_str):event('read');return o.core.deserialize_json_from_string(input_str)
                def write_to_string(input_otio):event('write');return o.core.serialize_json_to_string(input_otio)
                def hook(name,obj,extra_args=None):event(name);return obj
                o.hooks.run=hook
                adapter=o.adapters.Adapter('fixture','fixture.py',['fixture']);adapter._module=types.SimpleNamespace(read_from_string=read_from_string,write_to_string=write_to_string)
                obj=o.schema.Clip(name='keep');source=o.core.serialize_json_to_string(obj)
                with tempfile.TemporaryDirectory() as temp:
                    path=Path(temp)/'fixture.otio'
                    if action=='read_from_file' and failure!='file_io':path.write_text(source,encoding='utf-8')
                    if action=='write_to_file' and failure=='file_io':path=Path(temp)/'missing'/'fixture.otio'
                    try:
                        if action=='read_from_string':expected=adapter.read_from_string(source,media_linker_name=o.media_linker.MediaLinkingPolicy.DoNotLinkMedia)
                        elif action=='write_to_string':expected=adapter.write_to_string(obj)
                        elif action=='read_from_file':expected=adapter.read_from_file(str(path),media_linker_name=o.media_linker.MediaLinkingPolicy.DoNotLinkMedia)
                        else:expected=adapter.write_to_file(obj,str(path))
                    except Exception as e:status='error:'+type(e).__name__;success=False
                    else:status='valid';success=True
                    written=path.exists() if action=='write_to_file' else False
                body=['let registry=@plugins.Registry::new()','let calls:Array[String]=[]',f'let failure={q(failure)}']
                body+=['registry.register_adapter({name:"fixture",suffixes:["fixture"],read:fn(text){calls.push("read");if failure=="read"{Err("fixture_failure")}else{@otiojson.parse(text)}},write:fn(j){calls.push("write");if failure=="write"{Err("fixture_failure")}else{@otiojson.stringify(j)}}}).unwrap()']
                for phase in phases:body+=[f'registry.register_hook({q(phase)},fn(j,_args){{calls.push({q(phase)});if failure=={q(phase)}{{Err("fixture_failure")}}else{{Ok(j)}}}}).unwrap()']
                if action=='read_from_string':call=f'registry.read({q(source)},adapter="fixture")'
                elif action=='write_to_string':call=f'registry.write(@otiojson.parse({q(source)}).unwrap(),adapter="fixture")'
                elif action=='read_from_file':call=f'registry.read_file("fixture.otio",fn(_path){{if failure=="file_io"{{Err("file_failure")}}else{{Ok({q(source)})}}}},adapter="fixture")'
                else:
                    body+=['let writes:Array[String]=[]']
                    call=f'registry.write_file(@otiojson.parse({q(source)}).unwrap(),"fixture.otio",fn(_path,text){{if failure=="file_io"{{Err("file_failure")}}else{{writes.push(text);Ok(())}}}},adapter="fixture")'
                body+=[f'let result={call}',f'assert_eq(result is Ok(_),{str(success).lower()})',f'assert_eq(calls,{json.dumps(calls)})']
                if success and action.startswith('read'):body+=[f'assert_true(@otiojson.equivalent(result.unwrap(),@otiojson.parse({q(source)}).unwrap()))']
                if success and action=='write_to_string':body+=[f'assert_true(@otiojson.equivalent(@otiojson.parse(result.unwrap()).unwrap(),@otiojson.parse({q(source)}).unwrap()))']
                if action=='write_to_file':body+=[f'assert_eq(writes.length(),{int(written)})']
                emit('plugins',f'pipeline-{action}-{failure}',['Adapter.'+action],status,body)
        for cls,method,fnname in [(o.hooks.HookScript,'run','hook_function'),(o.media_linker.MediaLinker,'link_media_reference','link_media_reference')]:
            for fail in [False,True]:
                plugin=cls('fixture','fixture.py')
                def callback(**kwargs):
                    if fail:raise ValueError('fixture failure')
                    return kwargs.get('in_timeline') if method=='run' else o.schema.MissingReference(name='linked')
                plugin._module=types.SimpleNamespace(**{fnname:callback})
                obj=o.schema.Clip(name='keep');source=o.core.serialize_json_to_string(obj)
                try:expected=getattr(plugin,method)(obj)
                except ValueError:status='error:ValueError'
                else:status='valid'
                body=['let registry=@plugins.Registry::new()']
                callback_body='Err("fixture_failure")' if fail else 'Ok(j)' if method=='run' else f'@otiojson.parse({q(o.core.serialize_json_to_string(expected))})'
                if method=='run':
                    body+=[f'registry.register_hook("post_adapter_read",fn(j,_args){{ignore(j);{callback_body}}}).unwrap()'];call=f'registry.run_hooks("post_adapter_read",@otiojson.parse({q(source)}).unwrap(),Json::empty_object())'
                else:
                    body+=[f'registry.register_media_linker("fixture",fn(j,_args){{ignore(j);{callback_body}}}).unwrap()'];call=f'registry.link_media_reference(@otiojson.parse({q(source)}).unwrap(),"fixture")'
                body+=[f'let result={call}']
                body+=['assert_true(result is Err(_))'] if fail else [f'assert_true(@otiojson.equivalent(result.unwrap(),@otiojson.parse({q(o.core.serialize_json_to_string(expected))}).unwrap()))']
                emit('plugins',f'{cls.__name__}-{method}-{fail}',[cls.__name__+'.'+method],status,body)
        for name in ['fixture','other','']:
            linker=o.media_linker.MediaLinker('fixture','fixture.py');os.environ['OTIO_DEFAULT_MEDIA_LINKER']=name
            emit('plugins',f'default-linker-{name}',['MediaLinker.is_default_linker'],'valid',[f'assert_eq(@plugins.is_default_linker(@schema.read({q(o.core.serialize_json_to_string(linker))}).unwrap(),{q(name)}),{str(linker.is_default_linker()).lower()})'])
    finally:
        o.hooks.run=original_hook
        if original_default is None:os.environ.pop('OTIO_DEFAULT_MEDIA_LINKER',None)
        else:os.environ['OTIO_DEFAULT_MEDIA_LINKER']=original_default

def plugin_module_cases():
    classes=[o.adapters.Adapter,o.hooks.HookScript,o.media_linker.MediaLinker,o.schema.SchemaDef]
    def module_value(functions=None,doc='Fixture module',schemas=None):
        functions=functions or {}
        entries=[]
        for name,fn in functions.items():
            args=inspect.getfullargspec(fn).args;fn_doc=inspect.getdoc(fn)
            result=fn() if name=='adapter_hook_names' else None
            invoke='Err("ValueError:fixture_failure")' if name=='fails' else f'Ok(@otiojson.parse({raw(result)}).unwrap())'
            entries.append(f'{q(name)}:{{arguments:{json.dumps(args)},doc:{"None" if fn_doc is None else "Some("+q(fn_doc)+")"},invoke:fn(_args){{{invoke}}}}}')
        fields='{'+','.join(entries)+'}' if entries else 'Map([])'
        return f'@plugins.PluginModule::{{id:"fixture",doc:{"None" if doc is None else "Some("+q(doc)+")"},functions:{fields},schema_definitions:@otiojson.parse({raw(schemas or {})}).unwrap()}}'
    def setup(cls,functions=None,doc='Fixture module',schemas=None,filepath='/plugins/fixture.py',manifest='/plugins/manifest.json'):
        plugin=cls('fixture',filepath);plugin._json_path=manifest
        plugin._module=types.SimpleNamespace(__doc__=doc,**(functions or {}))
        value=module_value(functions,doc,schemas)
        body=[f'let descriptor=@schema.read({q(wire(plugin))}).unwrap()',f'let plugin=@plugins.Plugin::new(descriptor,fn(_description,_space){{Ok({value})}},manifest_path={"None" if manifest is None else "Some("+q(manifest)+")"}).unwrap()']
        return plugin,body
    for cls in classes:
        name=cls.__name__
        for mode in ['success','ImportError','ValueError','retry']:
            plugin=cls('fixture','/plugins/fixture.py');calls=[]
            mod=types.SimpleNamespace(id='fixture')
            def load(space):
                calls.append(space)
                if mode=='ImportError':raise ImportError('fixture')
                if mode=='ValueError':raise ValueError('fixture')
                if mode=='retry' and len(calls)==1:raise ImportError('fixture')
                return mod
            plugin._imported_module=load
            outcomes=[]
            for _ in range(2):
                try:outcomes.append(plugin.module() is mod)
                except Exception:outcomes.append(False)
            body=['let calls:Array[String]=[]',f'let descriptor=@schema.read({q(wire(plugin))}).unwrap()']
            fail='Err("'+mode+':fixture")' if mode in ['ImportError','ValueError'] else 'if calls.length()==1{Err("ImportError:fixture")}else{Ok('+module_value() +')}' if mode=='retry' else 'Ok('+module_value()+')'
            body+=[f'let plugin=@plugins.Plugin::new(descriptor,fn(_description,space){{calls.push(space);{fail}}}).unwrap()']
            for success in outcomes:body+=[f'assert_eq(plugin.load_module() is Ok(_),{str(success).lower()})']
            body+=[f'assert_eq(calls,{json.dumps(calls)})']
            emit('plugins',f'{name}-module-{mode}',[name+'.module'],'adapted:host_module_cache',body)
        for i,(filepath,manifest) in enumerate([('/absolute/mod.py',None),('mod.py',None),('mod.py',''),('mod.py','/plugins/manifest.json'),('../mod.py','/plugins/manifest.json'),('','/plugins/manifest.json'),('mod.py','manifest.json'),('/absolute/../mod.py','ignored'),('mod.py','/plugins//manifest.json'),('mod.py','//manifest.json'),('mod.py','///manifest.json')]):
            plugin,body=setup(cls,filepath=filepath,manifest=manifest)
            with patch.object(o.plugins.python_plugin,'os',types.SimpleNamespace(path=posixpath)):
                extra,status=expected_result('plugin.module_abs_path()',plugin.module_abs_path,lambda e,v:[f'assert_eq({e},{q(v)})'])
            emit('plugins',f'{name}-path-{i}',[name+'.module_abs_path'],status,body+extra)
    def read_from_string(input_str):
        """Read fixture."""
    def write_to_file(input_otio,filepath):
        """Write fixture."""
    def adapter_hook_names():return ['fixture_hook']
    def link_media_reference(in_clip,media_linker_argument_map):
        """Link fixture."""
    for i,functions in enumerate([{}, {'read_from_string':read_from_string}, {'write_to_file':write_to_file}, {'adapter_hook_names':adapter_hook_names}, {'read_from_string':read_from_string,'write_to_file':write_to_file,'adapter_hook_names':adapter_hook_names}]):
        plugin,body=setup(o.adapters.Adapter,functions)
        for feature in ['read','write','read_from_file','read_from_string','write_to_file','write_to_string','hooks','READ','Hooks','unknown','']:
            extra,status=expected_result(f'plugin.has_feature({q(feature)})',lambda:plugin.has_feature(feature),lambda e,v:[f'assert_eq({e},{str(v).lower()})'])
            emit('plugins',f'feature-{i}-{feature}',['Adapter.has_feature'],status,body+extra)
        extra,status=expected_result('plugin.adapter_hook_names()',plugin.adapter_hook_names,lambda e,v:[f'assert_true(@otiojson.equivalent({e},@otiojson.parse({raw(v)}).unwrap()))'])
        emit('plugins',f'adapter-hooks-{i}',['Adapter.adapter_hook_names'],status,body+extra)
    for error in [ImportError,ModuleNotFoundError,FileNotFoundError,ValueError]:
        plugin=o.adapters.Adapter('fixture','/plugins/fixture.py')
        def load(_space):raise error('fixture')
        plugin._imported_module=load
        body=[f'let plugin=@plugins.Plugin::new(@schema.read({q(wire(plugin))}).unwrap(),fn(_description,_space){{Err({q(error.__name__+":fixture")})}}).unwrap()']
        for feature in ['read','hooks','unknown','READ']:
            extra,status=expected_result(f'plugin.has_feature({q(feature)})',lambda:plugin.has_feature(feature),lambda e,v:[f'assert_eq({e},{str(v).lower()})'])
            emit('plugins',f'feature-error-{error.__name__}-{feature}',['Adapter.has_feature'],status,body+extra)
    for cls in classes:
        for variant in ['normal','empty','no_doc','no_manifest']:
            functions={'read_from_string':read_from_string,'write_to_file':write_to_file,'adapter_hook_names':adapter_hook_names} if cls==o.adapters.Adapter else {'link_media_reference':link_media_reference} if cls==o.media_linker.MediaLinker else {}
            if variant=='empty':functions={}
            plugin,body=setup(cls,functions,doc=None if variant=='no_doc' else 'Fixture module',manifest=None if variant=='no_manifest' else '/plugins/manifest.json')
            if cls==o.schema.SchemaDef and variant=='normal':
                plugin._module.Example=o.schema.Clip
                schemas={'Example':{'class':o.schema.Clip.__module__+'.'+o.schema.Clip.__name__,'doc':inspect.getdoc(o.schema.Clip)}}
                _,body=setup(cls,functions,schemas=schemas)
            with patch.object(o.plugins.python_plugin,'os',types.SimpleNamespace(path=posixpath)),patch.dict(os.environ,{'OTIO_DEFAULT_MEDIA_LINKER':'fixture'}):
                try:expected=plugin.plugin_info_map()
                except Exception as e:extra=['assert_true(plugin.plugin_info_map(default_linker="fixture") is Err(_))'];status='error:'+type(e).__name__
                else:
                    if 'SchemaDefs' in expected:
                        for entry in expected['SchemaDefs'].values():entry['class']=entry['class'].__module__+'.'+entry['class'].__name__
                    extra=[f'assert_true(@otiojson.equivalent(plugin.plugin_info_map(default_linker="fixture").unwrap(),@otiojson.parse({raw(expected)}).unwrap()))'];status='adapted:host_reflection'
            emit('plugins',f'{cls.__name__}-info-{variant}',[cls.__name__+'.plugin_info_map'],status,body+extra)
    for method,key,kind,by_suffix in [('adapter_module_from_name','fixture','adapters',False),('adapter_module_from_suffix','FIXTURE','adapters',True),('schemadef_module_from_name','fixture','schemadefs',False)]:
        for variant in ['success','missing','load_error']:
            manifest=o.plugins.manifest.Manifest();cls=o.schema.SchemaDef if kind=='schemadefs' else o.adapters.Adapter
            plugin=cls('fixture','/plugins/fixture.py');mod=types.SimpleNamespace(id='fixture')
            if cls==o.adapters.Adapter:plugin.suffixes=['fixture']
            def load(_space):
                if variant=='load_error':raise ImportError('fixture')
                return mod
            plugin._imported_module=load;setattr(manifest,kind,[plugin])
            lookup='missing' if variant=='missing' else key
            try:expected=getattr(manifest,method)(lookup);success=expected is mod
            except Exception:success=False
            loader='Err("ImportError:fixture")' if variant=='load_error' else 'Ok('+module_value()+')'
            call=f'@plugins.manifest_module(@schema.read({q(wire(manifest))}).unwrap(),{q(lookup)},fn(_descriptor){{{loader}}},kind={q(kind)},by_suffix={str(by_suffix).lower()})'
            emit('plugins',f'manifest-module-{method}-{variant}',['PluginManifest.'+method],'adapted:host_module_lookup',[f'assert_eq({call} is Ok(_),{str(success).lower()})'])

def free_function_cases():
    R=o.opentime.RationalTime
    for n in [-1,0,1,100]:
        for rate in [0,1,24,29.97]:
            t=R(n,rate)
            for method in ['to_frames','to_seconds','to_time_string','to_timecode','to_nearest_timecode']:
                call=f'{rt(t)}.{method}()'
                if (method in ['to_time_string','to_timecode'] and rate==0) or (method=='to_nearest_timecode' and o.opentime.RationalTime.nearest_smpte_timecode_rate(rate)==0):
                    body=[f'assert_true({call} is Err(_))'];status='upstream_unsafe:nonfinite_to_integer'
                elif method=='to_seconds':body=[f'api_number({call},{num(o.opentime.to_seconds(t))})'];status='valid'
                else:body,status=expected_result(call,lambda:getattr(o.opentime,method)(t),lambda e,v:[f'assert_eq({e},{q(v)})'])
                emit('functions',f'{method}-{n}-{rate}',['opentime.'+method],status,body)
            for method,call,fn in [('from_frames',f'@opentime.from_frames({num(n)},{num(rate)})',lambda:o.opentime.from_frames(n,rate)),('from_seconds',f'@opentime.from_seconds({num(n)})',lambda:o.opentime.from_seconds(n))]:
                if method=='from_seconds':body=checktime(call,fn());status='valid'
                else:body,status=expected_result(call,fn,checktime)
                emit('functions',f'{method}-{n}-{rate}',['opentime.'+method],status,body)
    for method,values in [('from_timecode',['00:00:01:00','00:01:00;00','bad']),('from_time_string',['00:00:01.5','00:00:00','bad'])]:
        for i,s in enumerate(values):
            body,status=expected_result(f'@opentime.{method}({q(s)},24.0)',lambda:getattr(o.opentime,method)(s,24),checktime)
            emit('functions',f'{method}-{i}',['opentime.'+method],status,body)
    for a,b in [(R(0,24),R(24,30)),(R(100,24),R(0,24)),(R(-1,1),R(1,30))]:
        for inclusive in [False,True]:
            suffix='_inclusive' if inclusive else ''
            for prefix,call,check in [('duration',f'@opentime.duration_from_start_end_time({rt(a)},{rt(b)},inclusive={str(inclusive).lower()})',checktime),('range',f'@opentime.from_start_end({rt(a)},{rt(b)},inclusive={str(inclusive).lower()})',checkrange)]:
                method=prefix+'_from_start_end_time'+suffix
                emit('functions',f'{method}-{a.value}-{b.value}',['opentime.'+method],'valid',check(call,getattr(o.opentime,method)(a,b)))
    for i,clips in enumerate([[],[o.schema.Clip(name='a')],[o.schema.Gap(),o.schema.Transition(),o.schema.Clip()],[o.schema.Marker()],[o.schema.Effect()]]):
        call='@schema.timeline_from_clips(['+','.join(f'@schema.read({q(wire(c))}).unwrap()' for c in clips)+'])'
        body,status=expected_result(call,lambda:o.schema.timeline_from_clips(clips),lambda e,v:[f'assert_true({e}.equivalent(@schema.read({q(wire(v))}).unwrap()))'])
        emit('functions',f'timeline-{i}',['schema.timeline_from_clips'],status,body)
    # Run both host path conventions deterministically, independently of the
    # machine regenerating the fixture. Only pathlib/OS conversion is adapted.
    import pathlib
    from urllib.request import url2pathname as native_url2pathname
    for windows in [False,True]:
        pathclass=pathlib.PureWindowsPath if windows else pathlib.PurePosixPath
        paths=types.SimpleNamespace(PurePath=pathclass,PureWindowsPath=pathlib.PureWindowsPath,PurePosixPath=pathlib.PurePosixPath)
        converter=nturl2path.url2pathname if windows else urllib.parse.unquote
        with patch.object(o.url_utils,'pathlib',paths),patch.object(o.url_utils,'os',types.SimpleNamespace(path=ntpath if windows else posixpath)),patch.object(o.url_utils,'request',types.SimpleNamespace(url2pathname=converter)):
            for method,inputs in [('url_from_filepath',['','a/b.mov','a b.mov','/a/b.mov','/a//./b.mov','//host/share/a.mov','C:/a b.mov','C:\\a\\b.mov','../a.mov','a%20b.mov','/中文/a.mov']),('filepath_from_url',['','file:','relative.mov','a%20b.mov','file:///a/b.mov','file:///a%2520b.mov','file://localhost/a.mov','file://host/share/a.mov','file://C:/a.mov','file:///C:/a.mov','C:/a.mov','file:///中文/a.mov','file:///a%ZZb.mov','file:///a%FFb.mov','file:///a//./b.mov','http://host/a.mov?q=1#x','a.mov;part','file:///a.mov;part','file://[bad/path','file:///a%00b.mov','file://host/S%3a/path/file.ext','file://unc/path/sub%20dir/file.ext','./docs','/a/%EF%BB%BFb','file:///a%252520b.mov','file:///a|/b.mov','file://localhost','file://host/'])]:
                for i,value in enumerate(inputs):
                    call=f'@url_utils.{method}({q(value)},windows={str(windows).lower()})'
                    if method=='url_from_filepath':body=[f'assert_eq({call},{q(getattr(o.url_utils,method)(value))})'];status='valid'
                    else:body,status=expected_result(call,lambda:getattr(o.url_utils,method)(value),lambda e,v:[f'assert_eq({e},{q(v)})'])
                    emit('functions',f'url-{windows}-{method}-{i}',['url_utils.'+method],status,body)

def core_function_cases():
    for method in ['type_version_map','release_to_schema_version_map']:
        # C++ unordered_map iteration differs between MSVC and GCC wheels.
        expected=json.loads(json.dumps(getattr(o.core,method)(),sort_keys=True))
        emit('functions',method,['core.'+method],'valid',[f'assert_true(@otiojson.equivalent(@core_api.{method}(),@otiojson.parse({raw(expected)}).unwrap()))'])
    with tempfile.TemporaryDirectory() as temp:
        for failure in ['none','io','malformed']:
            path=Path(temp)/('missing' if failure=='io' else 'source.otio')
            source='{' if failure=='malformed' else wire(o.schema.Clip(name='keep'))
            if failure!='io':path.write_text(source,encoding='utf-8')
            callback=f'fn(_path){{Err("file_error")}}' if failure=='io' else f'fn(_path){{Ok({q(source)})}}'
            body,status=expected_result(f'@core_api.deserialize_json_from_file("source.otio",{callback})',lambda:o.core.deserialize_json_from_file(str(path)),lambda e,v:[f'assert_true(@otiojson.equivalent({e},@otiojson.parse({q(wire(v))}).unwrap()))'])
            emit('functions','core-file-read-'+failure,['core.deserialize_json_from_file'],status,body)
        for failure in [False,True]:
            path=Path(temp)/('missing/output.otio' if failure else 'output.otio');obj=o.schema.Clip(name='keep')
            try:expected=o.core.serialize_json_to_file(obj,str(path));success=True
            except Exception:success=False
            body=['let writes:Array[String]=[]',f'let fail={str(failure).lower()}',f'let result=@core_api.serialize_json_to_file(@otiojson.parse({q(wire(obj))}).unwrap(),"output.otio",fn(_path,text){{if fail{{Err("file_error")}}else{{writes.push(text);Ok(())}}}})',f'assert_eq(result is Ok(_),{str(success).lower()})',f'assert_eq(writes.length(),{int(not failure)})']
            if success:body+=[f'assert_eq(result.unwrap(),{str(expected).lower()})',f'assert_true(@otiojson.equivalent(@otiojson.parse(writes[0]).unwrap(),@otiojson.parse({q(path.read_text(encoding="utf-8"))}).unwrap()))']
            emit('functions','core-file-write-'+str(failure),['core.serialize_json_to_file'],'valid' if success else 'error:ValueError',body)
    for name,obj in objects():
        source=wire(obj)
        expected=o.core.serialize_json_to_string(o.core.deserialize_json_from_string(source))
        emit('functions','core-json-'+name,['core.deserialize_json_from_string','core.serialize_json_to_string'],'valid',[f'let value=@core_api.deserialize_json_from_string({q(source)}).unwrap()',f'assert_true(@otiojson.equivalent(@otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),@otiojson.parse({q(expected)}).unwrap()))'])
    for i,text in enumerate(['{','null','[1,true,{"x":2}]','{"OTIO_SCHEMA":"Clip.2"}','{"OTIO_SCHEMA":"Future.9","x":[1,2]}','{"OTIO_SCHEMA":"Marker.1"}']):
        body,status=expected_result(f'@core_api.deserialize_json_from_string({q(text)})',lambda:o.core.deserialize_json_from_string(text),lambda e,v:[f'assert_true(@otiojson.equivalent({e},@otiojson.parse({q(o.core.serialize_json_to_string(v))}).unwrap()))'])
        emit('functions',f'core-read-{i}',['core.deserialize_json_from_string'],status,body)
    for i,(name,version,fields) in enumerate([('Clip',2,{}),('Clip',1,{}),('Future',1,{}),('Clip',9,{}),('Marker',1,{}),('RationalTime',1,{}),('Track',1,{'children':[]}),('Gap',1,{}),('Clip',2,{'media_references':{},'active_media_reference_key':'DEFAULT_MEDIA'})]):
        body,status=expected_result(f'@core_api.instance_from_schema({q(name)},{version},@otiojson.parse({raw(fields)}).unwrap())',lambda:o.core.instance_from_schema(name,version,fields),lambda e,v:[f'assert_true(@otiojson.equivalent({e},@otiojson.parse({q(o.core.serialize_json_to_string(v))}).unwrap()))'])
        emit('functions',f'instance-{i}',['core.instance_from_schema'],status,body)
    obj=o.schema.Stack(children=[o.schema.Track(children=[o.schema.Clip(source_range=o.opentime.TimeRange(o.opentime.RationalTime(0,24),o.opentime.RationalTime(24,24)))])])
    expected=o.core.flatten_stack(obj)
    emit('functions','core-flatten',['core.flatten_stack'],'valid',[f'assert_true(@algorithms.flatten_stack(@schema.read({q(wire(obj))}).unwrap()).unwrap().equivalent(@schema.read({q(wire(expected))}).unwrap()))'])
    # These registration APIs are adapted to native callbacks, not Python class
    # monkey-patching. The official decorators really execute in the oracle.
    @o.core.register_type
    class APICompatibilityFixture(o.core.SerializableObject):
        _serializable_label='APICompatibilityFixture.2'
        value=o.core.serializable_field('value',int)
    @o.core.upgrade_function_for(APICompatibilityFixture,2)
    def upgrade(data):data['value']=data.pop('old_value')+1;return dict(data)
    @o.core.downgrade_function_from(APICompatibilityFixture,2)
    def downgrade(data):data['old_value']=data.pop('value')-1;return dict(data)
    for value in [-1,0,3]:
        source={'OTIO_SCHEMA':'APICompatibilityFixture.1','old_value':value}
        expected=o.core.deserialize_json_from_string(json.dumps(source))
        downgraded=o.core.serialize_json_to_string(expected,{'APICompatibilityFixture':1})
        setup=['let registry=@plugins.Registry::new()', 'registry.register_schema({name:"APICompatibilityFixture",version:2,upgrade:fn(j,_v){match j{Object(m)=>{let n=match m.get("old_value"){Some(Number(n,..))=>n;_=>return Err("missing_old")};m.remove("old_value");m["value"]=Json::number(n+1.0);Ok(Json::object(m))};_=>Err("invalid")}},downgrade:fn(j,_v){match j{Object(m)=>{let n=match m.get("value"){Some(Number(n,..))=>n;_=>return Err("missing_value")};m.remove("value");m["old_value"]=Json::number(n-1.0);Ok(Json::object(m))};_=>Err("invalid")}}}).unwrap()']
        setup += [f'let upgraded=registry.upgrade_document(@otiojson.parse({raw(source)}).unwrap()).unwrap()',f'assert_true(@otiojson.equivalent(upgraded,@otiojson.parse({q(wire(expected))}).unwrap()))','registry.register_version_manifest("legacy",{"APICompatibilityFixture":1}).unwrap()',f'assert_true(@otiojson.equivalent(@otiojson.parse(registry.write_versions(upgraded,"legacy").unwrap()).unwrap(),@otiojson.parse({q(downgraded)}).unwrap()))']
        emit('functions',f'custom-schema-{value}',['core.'+n for n in ['register_type','register_serializable_object_type','upgrade_function_for','downgrade_function_from','register_upgrade_function','register_downgrade_function']],'adapted:native_schema_registration',setup)

def plugin_argument_cases():
    for action in ['read_from_string','read_from_file','write_to_string','write_to_file']:
        for native in [False,True]:
            for supports_hooks in [False,True]:
                for rich in [False,True]:
                    for failure in ['none','adapter','hook','media','file']:
                        events=[]
                        def record(name,args,category):
                            events.append({'event':name,'args':json.loads(wire(args))})
                            if failure==category:raise ValueError('fixture')
                        def operation(name,**args):
                            record(name,args,'adapter')
                            return o.schema.Clip(name='read') if name.startswith('read') else 'fixture-output'
                        funcs={n:(lambda _n=n,**kw:operation(_n,**kw)) for n in ['read_from_string','write_to_string']+(['read_from_file','write_to_file'] if native else [])}
                        if supports_hooks:funcs['adapter_hook_names']=lambda:[]
                        plugin=o.adapters.Adapter('fixture','/plugins/fixture.py');plugin._module=types.SimpleNamespace(**funcs)
                        def hook(name,obj,extra_args=None):
                            record(name,extra_args,'hook')
                            if extra_args and 'adapter_arguments' in extra_args and 'nested' in extra_args['adapter_arguments']:extra_args['adapter_arguments']['nested']['keep']=2
                            value=obj.deepcopy();value.name+=':hook';return value
                        def link(obj,name,args):record('link',{'name':name,'arguments':args},'media')
                        def opened(path,mode='r',**kwargs):
                            record('file_write' if mode=='w' else 'file_read',{'path':path},'file')
                            return io.StringIO() if mode=='w' else io.StringIO('fixture-input')
                        adapter_args={'extra':7,'nested':{'keep':1}} if rich else {}
                        hook_args={'user':'keep'} if rich else None
                        media_args={'media':'keep'} if rich else None
                        kwargs=dict(adapter_args,hook_function_argument_map=hook_args)
                        if action.startswith('read'):kwargs.update(media_linker_argument_map=media_args,media_linker_name='fixture')
                        obj=o.schema.Clip(name='write')
                        with patch.object(o.hooks,'run',hook),patch.object(o.adapters.adapter,'_with_linked_media_references',link),patch('builtins.open',opened):
                            try:
                                if action=='read_from_string':expected=plugin.read_from_string('fixture-input',**kwargs)
                                elif action=='read_from_file':expected=plugin.read_from_file('/fixture.otio',**kwargs)
                                elif action=='write_to_string':expected=plugin.write_to_string(obj,**kwargs)
                                else:expected=plugin.write_to_file(obj,'/fixture.otio',**kwargs)
                            except Exception as e:success=False;status='error:'+type(e).__name__
                            else:success=True;status='valid'
                        body=[f'let failure={q(failure)}','let events:Array[Json]=[]','fn record(name:String,args:Json,category:String)->Result[Unit,String]{events.push(Json::object({"event":Json::string(name),"args":@otiojson.clone(args).unwrap()}));if failure==category{Err("fixture")}else{Ok(())}}']
                        functions=[]
                        for name in funcs:
                            if name=='adapter_hook_names':callback='Ok(Json::array([]))'
                            else:
                                returned=f'@otiojson.parse({q(wire(o.schema.Clip(name="read")))}).unwrap()' if name.startswith('read') else 'Json::string("fixture-output")'
                                callback=f'match record({q(name)},args,"adapter"){{Err(e)=>Err(e);Ok(_)=>Ok({returned})}}'
                            functions.append(f'{q(name)}:{{arguments:[],doc:None,invoke:fn(args){{ignore(args);{callback}}}}}')
                        body+=[f'let plugin=@plugins.Plugin::new(@schema.read({q(wire(plugin))}).unwrap(),fn(_d,_n){{Ok({{id:"fixture",doc:None,functions:{{{",".join(functions)}}},schema_definitions:Json::empty_object()}})}}).unwrap()']
                        body+=['let services:@plugins.PluginIO={read_file:fn(path){match record("file_read",Json::object({"path":Json::string(path)}),"file"){Err(e)=>Err(e);Ok(_)=>Ok("fixture-input")}},write_file:fn(path,_text){record("file_write",Json::object({"path":Json::string(path)}),"file")},hook:fn(name,j,args){match record(name,args,"hook"){Err(e)=>return Err(e);_=>()};match args{Object(a)=>match a.get("adapter_arguments"){Some(Object(a))=>match a.get("nested"){Some(Object(n))=>n["keep"]=Json::number(2.0);_=>()};_=>()};_=>()};let copy=@otiojson.clone(j).unwrap();match copy{Object(m)=>{let old=match m.get("name"){Some(String(s))=>s;_=>""};m["name"]=Json::string(old+":hook");Ok(copy)};_=>Err("invalid")}},link_media:fn(j,name,args){match record("link",Json::object({"name":Json::string(name),"arguments":args}),"media"){Err(e)=>Err(e);Ok(_)=>Ok(j)}}}']
                        extra=f'adapter_arguments=@otiojson.parse({raw(adapter_args)}).unwrap(),hook_arguments=@otiojson.parse({raw(hook_args)}).unwrap()'
                        if action.startswith('read'):call=f'plugin.read_document({q("/fixture.otio" if action.endswith("file") else "fixture-input")},services,from_file={str(action.endswith("file")).lower()},{extra},media_arguments=@otiojson.parse({raw(media_args)}).unwrap(),media_linker=Some("fixture"))'
                        else:
                            filepath_option='Some("/fixture.otio")' if action.endswith('file') else 'None'
                            call=f'plugin.write_document(@otiojson.parse({q(wire(obj))}).unwrap(),services,{extra},filepath={filepath_option})'
                        body+=[f'let result={call}',f'assert_eq(result is Ok(_),{str(success).lower()})',f'assert_true(@otiojson.equivalent(Json::array(events),@otiojson.parse({raw(events)}).unwrap()))']
                        if success:body+=[f'assert_true(@otiojson.equivalent(result.unwrap(),@otiojson.parse({q(wire(expected))}).unwrap()))']
                        emit('plugins',f'arguments-{action}-{native}-{supports_hooks}-{rich}-{failure}',['Adapter.'+action],status,body)

def context_function_cases():
    manifest=o.plugins.manifest.Manifest()
    a=o.adapters.Adapter('read','read.py',['same','read']);a._module=types.SimpleNamespace(read_from_string=lambda input_str:o.core.deserialize_json_from_string(input_str))
    b=o.adapters.Adapter('write','write.py',['same','write']);b._module=types.SimpleNamespace(write_to_string=lambda input_otio:o.core.serialize_json_to_string(input_otio))
    manifest.adapters=[a,b];manifest.media_linkers=[o.media_linker.MediaLinker('link','link.py')]
    manifest.hook_scripts=[o.hooks.HookScript('first','first.py'),o.hooks.HookScript('second','second.py')]
    manifest.hooks={'custom':['first','second'],'empty':[]}
    base=[f'let manifest=@schema.read({q(wire(manifest))}).unwrap()']
    with patch.object(o.plugins,'ActiveManifest',return_value=manifest):
        for mod,method,kind in [(o.adapters,'available_adapter_names','adapters'),(o.media_linker,'available_media_linker_names','media_linkers'),(o.hooks,'available_hookscript_names','hook_scripts')]:
            module=mod.__name__.split('.')[-1]
            emit('functions',method,[module+'.'+method],'valid',base+[f'assert_eq(@plugins.manifest_names(manifest,{q(kind)}).unwrap(),{json.dumps(getattr(mod,method)())})'])
        expected=o.hooks.available_hookscripts()
        emit('functions','available-hooks',['hooks.available_hookscripts'],'adapted:detached_values',base+['let scripts=@plugins.manifest_plugins(manifest,"hook_scripts").unwrap()',f'assert_eq(scripts.length(),{len(expected)})',*[f'assert_true(scripts[{i}].equivalent(@schema.read({q(wire(v))}).unwrap()))' for i,v in enumerate(expected)]])
        emit('functions','hook-names',['hooks.names'],'adapted:unordered_keys',base+['let names=@plugins.hook_names(manifest).unwrap()',f'assert_eq(names.length(),{len(o.hooks.names())})',*[f'assert_true(names.contains({q(n)}))' for n in o.hooks.names()]])
        for name in ['custom','empty','missing']:
            body,status=expected_result(f'@plugins.scripts_attached_to(manifest,{q(name)})',lambda:list(o.hooks.scripts_attached_to(name)),lambda e,v:[f'assert_eq({e},{json.dumps(v)})'])
            emit('functions','scripts-'+name,['hooks.scripts_attached_to'],status,base+body)
        for name in ['read','write','missing','']:
            body,status=expected_result(f'@plugins.manifest_from_name(manifest,{q(name)})',lambda:o.adapters.from_name(name),lambda e,v:[f'assert_true({e}.equivalent(@schema.read({q(wire(v))}).unwrap()))'])
            emit('functions','adapter-name-'+name,['adapters.from_name'],status,base+body)
        for i,path in enumerate(['a.read','a.READ','a.write','.read','dir.dot/file','dir.dot/a.read','a.','a.bad']):
            body,status=expected_result(f'@plugins.adapter_from_filepath(manifest,{q(path)})',lambda:o.adapters.from_filepath(path),lambda e,v:[f'assert_true({e}.equivalent(@schema.read({q(wire(v))}).unwrap()))'])
            emit('functions',f'adapter-filepath-{i}',['adapters.from_filepath'],status,base+body)
        for read in [False,True]:
            for write in [False,True]:
                expected=o.adapters.suffixes_with_defined_adapters(read,write)
                call=f'@plugins.suffixes_with_defined_adapters(manifest,fn(d,feature){{Ok(d.get("name")==Some(Json::string(feature)))}},read={str(read).lower()},write={str(write).lower()}).unwrap()'
                emit('functions',f'suffixes-{read}-{write}',['adapters.suffixes_with_defined_adapters'],'adapted:unordered_set',base+[f'let suffixes={call}',f'assert_eq(suffixes.length(),{len(expected)})',*[f'assert_true(suffixes.contains({q(s)}))' for s in sorted(expected)]])
        for fail in [False,True]:
            for hook in ['custom','empty','missing']:
                calls=[]
                for script in manifest.hook_scripts:
                    def run(in_timeline,argument_map,name=script.name):
                        calls.append(name)
                        if fail and name=='second':raise ValueError('fixture')
                        in_timeline.name+=':'+name;return in_timeline
                    script._module=types.SimpleNamespace(hook_function=run)
                clip=o.schema.Clip(name='keep')
                try:expected=o.hooks.run(hook,clip,{'x':1});success=True
                except Exception:success=False
                callback='fn(d,j,_args){let name=match d.get("name"){Some(String(s))=>s;_=>""};calls.push(name);if fail && name=="second"{return Err("fixture")};match j{Object(m)=>{let old=match m.get("name"){Some(String(s))=>s;_=>""};m["name"]=Json::string(old+":"+name);Ok(Json::object(m))};_=>Err("invalid")}}'
                body=base+['let calls:Array[String]=[]',f'let fail={str(fail).lower()}',f'let result=@plugins.run_manifest_hooks(manifest,{q(hook)},@otiojson.parse({q(wire(o.schema.Clip(name="keep")))}).unwrap(),Json::object({{"x":Json::number(1.0)}}),{callback})',f'assert_eq(result is Ok(_),{str(success).lower()})',f'assert_eq(calls,{json.dumps(calls)})']
                if success:body+=[f'assert_true(@otiojson.equivalent(result.unwrap(),@otiojson.parse({q(wire(expected))}).unwrap()))']
                emit('functions',f'hooks-run-{hook}-{fail}',['hooks.run'],'valid' if success else 'error:hook_failure',body)
        for default in [None,'','link','missing']:
            environment=dict(os.environ);environment.pop('OTIO_DEFAULT_MEDIA_LINKER',None)
            if default is not None:environment['OTIO_DEFAULT_MEDIA_LINKER']=default
            option='None' if default is None else 'Some('+q(default)+')'
            with patch.dict(os.environ,environment,clear=True):
                body,status=expected_result(f'@plugins.default_media_linker({option})',o.media_linker.default_media_linker,lambda e,v:[f'assert_eq({e},{q(v)})'])
                emit('functions',f'default-linker-{default}',['media_linker.default_media_linker'],status,body)
                for name in [None,'','__default','link','missing']:
                    arg='None' if name is None else 'Some('+q(name)+')'
                    body,status=expected_result(f'@plugins.media_linker_from_name(manifest,{arg},{option})',lambda:o.media_linker.from_name(name),lambda e,v:[f'assert_true({e} is None)'] if v is None else [f'assert_true({e}.unwrap().equivalent(@schema.read({q(wire(v))}).unwrap()))'])
                    emit('functions',f'linker-from-name-{default}-{name}',['media_linker.from_name'],status,base+body)
                    manifest.media_linkers[0]._module=types.SimpleNamespace(link_media_reference=lambda **kwargs:o.schema.MissingReference(name='linked'))
                    clip=o.schema.Clip(name='keep')
                    call=f'@plugins.linked_media_reference(manifest,@otiojson.parse({q(wire(clip))}).unwrap(),{arg},{option},Json::empty_object(),fn(_d,_c,_a){{@otiojson.parse({q(wire(o.schema.MissingReference(name="linked")))})}})'
                    body,status=expected_result(call,lambda:o.media_linker.linked_media_reference(clip,name),lambda e,v:[f'assert_true(@otiojson.equivalent({e},@otiojson.parse({q(wire(v))}).unwrap()))'])
                    emit('functions',f'linked-reference-{default}-{name}',['media_linker.linked_media_reference'],status,base+body)
        manifest.source_files=['/plugins/manifest.json']
        for fail in [False,True]:
            for plugin in [*manifest.adapters,*manifest.media_linkers,*manifest.hook_scripts]:
                def info(name=plugin.name):
                    if fail and name=='second':raise ValueError('fixture')
                    return {'name':name}
                plugin.plugin_info_map=info
            with patch.object(o.plugins.manifest,'ActiveManifest',return_value=manifest):
                expected=json.loads(wire(o.plugins.plugin_info_map()))
            call='@plugins.plugin_info_map({manifest,source_files:["/plugins/manifest.json"]},fn(d){let name=d.get("name").unwrap();if fail && name==Json::string("second"){Err("fixture")}else{Ok(Json::object({"name":name}))}}).unwrap()'
            emit('functions',f'all-plugin-info-{fail}',['plugins.plugin_info_map'],'adapted:host_reflection',base+[f'let fail={str(fail).lower()}',f'assert_true(@otiojson.equivalent({call},@otiojson.parse({raw(expected)}).unwrap()))'])
        manifest.version_manifests={'family':{'v1':{'Clip':1}}}
        with patch.object(o.plugins.manifest,'ActiveManifest',return_value=manifest):
            try:o.plugins.plugin_info_map()
            except AttributeError:pass
            else:raise AssertionError('Expected upstream version manifest reflection failure')
        emit('functions','plugin-info-version-family',['plugins.plugin_info_map'],'error:AttributeError',[f'let manifest=@schema.read({q(wire(manifest))}).unwrap()','assert_true(@plugins.plugin_info_map({manifest,source_files:[]},fn(_d){Ok(Json::empty_object())}) is Err(_))'])
        manifest.version_manifests={}
    original=o.plugins.manifest._MANIFEST
    try:
        for fail in [False,True]:
            calls=[];o.plugins.manifest._MANIFEST=None;outcomes=[]
            def loader():
                calls.append('load')
                if fail and len(calls)==2:raise ValueError('fixture')
                return manifest
            with patch.object(o.plugins.manifest,'load_manifest',loader):
                for reload in [False,False,True,False]:
                    try:o.plugins.ActiveManifest(reload);outcomes.append(True)
                    except Exception:outcomes.append(False)
            body=base+['let calls:Array[String]=[]',f'let fail={str(fail).lower()}','let context=@plugins.ManifestContext::new(fn(){calls.push("load");if fail && calls.length()==2{Err("fixture")}else{Ok({manifest,source_files:[]})}})']
            for reload,success in zip([False,False,True,False],outcomes):body+=[f'assert_eq(context.active(force_reload={str(reload).lower()}) is Ok(_),{str(success).lower()})']
            emit('functions',f'active-manifest-{fail}',['plugins.ActiveManifest'],'adapted:host_local_context',body+[f'assert_eq(calls,{json.dumps(calls)})'])
    finally:o.plugins.manifest._MANIFEST=original
    with tempfile.TemporaryDirectory() as temp:
        path=Path(temp)/'manifest.json'
        for i,source in enumerate([wire(manifest),wire(o.schema.Clip()),'{']):
            path.write_text(source,encoding='utf-8')
            try:expected=o.plugins.manifest_from_file(str(path));success=True
            except Exception:success=False
            body=[f'let result=@plugins.manifest_from_file("/plugins/manifest.json",fn(_path){{Ok({q(source)})}})',f'assert_eq(result is Ok(_),{str(success).lower()})']
            if success:body+=[f'assert_true(result.unwrap().manifest.equivalent(@schema.read({q(wire(expected))}).unwrap()))','assert_eq(result.unwrap().source_files,["/plugins/manifest.json"])']
            emit('functions',f'manifest-file-{i}',['plugins.manifest_from_file'],'valid' if success else 'error:manifest_file',body)
    for action in ['read_from_string','write_to_string']:
        for value in [o.schema.Timeline(),o.schema.Clip(name='keep'),o.schema.Marker(name='keep')]:
            source=wire(value)
            if action=='read_from_string':expected=o.adapters.read_from_string(source,'otio_json');call=f'@plugins.Registry::new().read({q(source)}).unwrap()'
            else:expected=o.adapters.write_to_string(value,'otio_json');call=f'@otiojson.parse(@plugins.Registry::new().write(@otiojson.parse({q(source)}).unwrap()).unwrap()).unwrap()'
            expected=wire(expected) if action=='read_from_string' else expected
            emit('functions',f'adapter-shortcut-{action}-{type(value).__name__}',['adapters.'+action],'valid',[f'assert_true(@otiojson.equivalent({call},@otiojson.parse({q(expected)}).unwrap()))'])
    for text in ['{','{"OTIO_SCHEMA":"Clip.2"}']:
        body,status=expected_result(f'@plugins.Registry::new().read({q(text)})',lambda:o.adapters.read_from_string(text,'otio_json'),lambda e,v:[])
        emit('functions','adapter-shortcut-read-'+text,['adapters.read_from_string'],status,body)

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
    parser=argparse.ArgumentParser();parser.add_argument('--group',default='all',choices=['all','fields','objects','time','spatial','codecs','graph','image','algorithms','traversal','collections','media_properties','plugins','functions']);args=parser.parse_args()
    if args.group in ['fields','all']:schema_cases()
    if args.group in ['objects','all']:object_cases()
    if args.group in ['time','all']:time_cases()
    if args.group in ['spatial','all']:spatial_cases()
    if args.group in ['codecs','all']:codec_cases()
    if args.group in ['graph','all']:graph_cases()
    if args.group in ['image','all']:image_cases()
    if args.group in ['algorithms','all']:algorithm_cases()
    if args.group in ['traversal','all']:traversal_cases()
    if args.group in ['collections','all']:collection_cases()
    if args.group in ['media_properties','all']:media_property_cases()
    if args.group in ['plugins','all']:manifest_cases()
    if args.group in ['plugins','all']:plugin_pipeline_cases()
    if args.group in ['plugins','all']:plugin_module_cases()
    if args.group in ['plugins','all']:plugin_argument_cases()
    if args.group in ['functions','all']:free_function_cases()
    if args.group in ['functions','all']:context_function_cases()
    if args.group in ['functions','all']:core_function_cases()
    for group,lines in FILES.items():
        write_generated(ROOT/f'conformance/api_{group}_test.mbt','\n'.join(lines)+'\n')
    if args.group != 'all':
        print(f'Generated {len(CASES)} differential cases for {args.group}; full coverage ledger unchanged')
        return
    write_generated(ROOT/'docs/api-conformance-cases.json',json.dumps({'upstream':'0.18.1','cases':CASES},ensure_ascii=False,indent=2)+'\n')
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
    for module,names in inventory.get('functions',{}).items():
        for name in names:
            key=module+'.'+name;ids=index.get(key,[])
            binding_only={'core.add_method':'Python class monkey-patching; use native MoonBit methods.','core.deprecated_field':'Python property descriptor/deprecation exception; native schemas use explicit fields.','core.serializable_field':'Python property descriptor and setter type checks; wire fields have separate tests.','core.set_type_record':'C++/Python object-wrapper identity bookkeeping; no corresponding native object wrapper.','core.install_external_keepalive_monitor':'C++/Python reference-count monitor; MoonBit GC is host-managed.'}
            host_file=key in ['core.deserialize_json_from_file','core.serialize_json_to_file','adapters.read_from_file','adapters.write_to_file']
            entry={'upstream':key,'case_ids':ids,'status':'cases_present' if ids else 'binding_specific_not_ported' if key in binding_only else 'host_roundtrip_cases_present' if host_file else 'not_covered_by_this_generator'}
            if key in binding_only:entry['reason']=binding_only[key]
            if host_file:entry['host_test']='tools/check_api_files.py'
            members.append(entry)
    coverage={'upstream':'0.18.1','meaning':'Case links, not a complete compatibility certification. Field wire tests do not prove Python setter, identity or host behavior. Exceptions currently compare success versus Result error, not Python exception class/message. Existing legacy tests are separate.','members':members}
    missing=[entry['upstream'] for entry in members if entry['status']=='not_covered_by_this_generator']
    assert not missing,'Public API entries lack test evidence or an explicit binding boundary: '+', '.join(missing)
    write_generated(ROOT/'docs/api-conformance-coverage.json',json.dumps(coverage,ensure_ascii=False,indent=2)+'\n')
    print(f'Generated {len(CASES)} differential cases')
if __name__=='__main__':main()
