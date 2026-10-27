"""Reproducible public-surface inventory, not a conformance percentage."""
import argparse
import json
from pathlib import Path
import opentimelineio as o

assert o.__version__ == '0.18.1'
root=Path(__file__).resolve().parents[1]
modules={name:getattr(o,name) for name in ['opentime','core','schema','adapters','plugins','hooks','media_linker','schemadef','algorithms','url_utils']}
classes={}
names=set(o.core.type_version_map())-{'Test','UnknownSchema','PluginManifest'}
names.update(['RationalTime','TimeRange','TimeTransform','V2d','Box2d'])
for name in sorted(names):
    for module,namespace in modules.items():
        cls=getattr(namespace,name,None)
        if isinstance(cls,type):
            classes[f'{module}.{name}']=[n for n in dir(cls) if not n.startswith('_')]
            break
    else:raise RuntimeError(name)
classes['plugins.PluginManifest']=[n for n in dir(o.plugins.manifest.Manifest) if not n.startswith('_')]
classes['schema.Color']=[n for n in dir(o._otio.Color) if not n.startswith('_')]
data={'upstream_version':'0.18.1','commit':'44236713c1db295a6ffc66189ae98dbdfd0cb9c4',
      'meaning':'Upstream inventory only; presence is not a passed compatibility test.',
      'classes':classes,
      'algorithms':[n for n in dir(o.algorithms) if not n.startswith('_') and callable(getattr(o.algorithms,n))]}
target=root/'docs/otio-api-inventory.json'
text=json.dumps(data,ensure_ascii=False,indent=2)+'\n'
parser=argparse.ArgumentParser();parser.add_argument('--check',action='store_true');args=parser.parse_args()
if args.check:
    assert target.read_text(encoding='utf-8')==text,'Upstream API inventory changed'
else:target.write_text(text,encoding='utf-8',newline='\n')
print(f'Inventoried {len(classes)} classes and {len(data["algorithms"])} public algorithms')
