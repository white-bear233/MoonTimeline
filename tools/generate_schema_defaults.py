"""Construct official default objects; no upstream source is copied."""
import json
from pathlib import Path
import opentimelineio as o
assert o.__version__ == '0.18.1'
root=Path(__file__).resolve().parents[1]
objects={}
for name in sorted(o.core.type_version_map()):
    if name in ('Test','UnknownSchema','PluginManifest'): continue
    for module in [o.core,o.schema,o.adapters,o.plugins,o.hooks,o.media_linker,o.schemadef]:
        cls=getattr(module,name,None)
        if cls:
            objects[name]=cls();break
    else: raise RuntimeError(name)
objects.update(PluginManifest=o.plugins.manifest.Manifest(), RationalTime=o.opentime.RationalTime(),
               TimeRange=o.opentime.TimeRange(),TimeTransform=o.opentime.TimeTransform(),
               V2d=o.schema.V2d(),Box2d=o.schema.Box2d(),Color=o._otio.Color())
lines=['// Generated from official OTIO 0.18.1 constructors.', '','///|',
       'pub fn registered_schemas() -> Array[String] {',
       '  ['+', '.join(json.dumps(k) for k in sorted(objects))+']','}', '', '///|',
       'fn default_json(name : String) -> Result[Json, String] {','  let source = match name {']
tests=['// Generated official default-object roundtrip cases.']
for name,obj in sorted(objects.items()):
    value=json.loads(o.adapters.write_to_string(obj,'otio_json'))
    raw=json.dumps(value,separators=(',',':'),ensure_ascii=False)
    quoted=json.dumps(raw,ensure_ascii=False)
    lines.append(f'    {json.dumps(name)} => {quoted}')
    tests += ['', '///|',f'test "official schema default {name}" {{',
              f'  let obj = @schema.Object::new({json.dumps(name)}).unwrap()',
              f'  let expected = @otiojson.parse({quoted}).unwrap()',
              '  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))',
              '  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()',
              '  assert_true(obj.equivalent(parsed))','}']
lines += ['    _ => return Err("unknown_schema:" + name)','  }','  @otiojson.parse(source)','}']
(root/'schema/defaults.mbt').write_text('\n'.join(lines)+'\n',encoding='utf-8',newline='\n')
(root/'schema/defaults_test.mbt').write_text('\n'.join(tests)+'\n',encoding='utf-8',newline='\n')

colors = ['///|','pub fn Color::named(name : String) -> Result[Color,String] {','  match name.to_upper() {']
for name in ['BLACK','BLUE','CYAN','GREEN','MAGENTA','ORANGE','PINK','PURPLE','RED','TRANSPARENT','WHITE','YELLOW']:
    color=getattr(o._otio.Color,name)
    colors.append(f'    "{name}" => Ok({{r:{color.r},g:{color.g},b:{color.b},a:{color.a},name:{json.dumps(color.name)}}})')
colors += ['    _ => Err("unknown_color")','  }','}']
(root/'schema/color_names.mbt').write_text('\n'.join(colors)+'\n',encoding='utf-8',newline='\n')
