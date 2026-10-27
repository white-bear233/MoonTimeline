"""Bidirectional interoperability with official OTIO 0.18.1 and hostile ZIPs."""
import json
from pathlib import Path
import subprocess
import tempfile
import zipfile
import opentimelineio as o

ROOT = Path(__file__).resolve().parents[1]
assert o.__version__ == '0.18.1'

def cli(*args, success=True):
    result = subprocess.run(['node', 'cmd/moontimeline.mjs', *map(str,args)], cwd=ROOT,
                            capture_output=True, encoding='utf-8')
    assert (result.returncode == 0) == success, result.stdout + result.stderr
    return result

with tempfile.TemporaryDirectory(prefix='bundle-check-', dir=ROOT/'_build') as work:
    work = Path(work)
    media = work/'a 中.mov'
    payload = bytes(range(256))*41
    media.write_bytes(payload)
    clip = o.schema.Clip(name='A', media_reference=o.schema.ExternalReference(target_url=media.as_uri()),
                         source_range=o.opentime.TimeRange(o.opentime.RationalTime(24,24),o.opentime.RationalTime(48,24)))
    clip.metadata['nested'] = {'project':'测试','values':[1,2,3]}
    clip.markers.append(o.schema.Marker(name='keep',marked_range=clip.source_range))
    timeline = o.schema.Timeline(tracks=[o.schema.Track(children=[clip])])
    source = work/'input.otio'
    o.adapters.write_to_file(timeline,str(source))
    # MoonBit-produced ZIP and directory are readable by official adapters.
    for extension in ['otioz','otiod']:
        output = work/f'moon.{extension}'
        cli('pack',source,'--output',output)
        restored = o.adapters.read_from_file(str(output),adapter_name=extension)
        assert json.loads(o.adapters.write_to_string(list(restored.find_clips())[0]))['metadata'] == json.loads(o.adapters.write_to_string(clip))['metadata']
        assert list(restored.find_clips())[0].markers[0].name == 'keep'
        if extension=='otioz':
            with zipfile.ZipFile(output) as z:
                assert z.read('media/'+media.name)==payload
        else: assert (output/'media'/media.name).read_bytes()==payload
        cli('pack',source,'--output',output,success=False)
    # Official-produced bundles are consumed by MoonBit, with byte-exact media.
    for extension in ['otioz','otiod']:
        archive = work/f'official.{extension}'
        o.adapters.write_to_file(timeline,str(archive),adapter_name=extension)
        folder = work/f'unpacked-{extension}'
        cli('unpack',archive,'--output',folder)
        assert (folder/'media'/media.name).read_bytes()==payload
        restored = o.adapters.read_from_file(str(folder/'content.otio'))
        assert json.loads(o.adapters.write_to_string(list(restored.find_clips())[0]))['metadata'] == json.loads(o.adapters.write_to_string(clip))['metadata']
        # Repack a bundle without reopening original external media.
        cli('pack',archive,'--output',work/f'repacked-{extension}.otioz')
    # Invalid archives fail before creating an extraction directory.
    for name in ['../escape','C:/escape','media/../../escape','media\\escape','NUL.txt']:
        archive=work/'unsafe.otioz'
        with zipfile.ZipFile(archive,'w') as z:
            z.writestr('content.otio',o.adapters.write_to_string(timeline))
            entry=zipfile.ZipInfo('placeholder')
            entry.filename=name  # bypass Windows ZipInfo slash normalization
            z.writestr(entry,b'bad')
        out=work/'must-not-exist'
        cli('unpack',archive,'--output',out,success=False)
        assert not out.exists()
    # New object/algorithm CLI accepts non-Timeline roots and preserves fields.
    collection=o.schema.SerializableCollection(children=[timeline,clip])
    c=work/'collection.otio'
    o.adapters.write_to_file(collection,str(c))
    converted=work/'collection-out.otio'
    cli('convert',c,'--output',converted)
    assert o.adapters.read_from_file(str(converted)).is_equivalent_to(collection)
    flattened=work/'flattened.otio'
    cli('flatten',source,'--output',flattened)
    assert o.adapters.read_from_file(str(flattened)).schema_name()=='Track'
    filtered=work/'filtered.otio'
    cli('filter',source,'--prune','Clip','--output',filtered)
    assert len(list(o.adapters.read_from_file(str(filtered)).find_clips()))==0
    found=json.loads(cli('find',source,'--schema','Clip').stdout)
    assert found==[[0,0,0]]
print('OTIOZ/OTIOD official bidirectional media, metadata, hostile paths and object CLI verified')
