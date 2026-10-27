"""Differential graph, image sequence and algorithms tests using OTIO 0.18.1."""
import json
from pathlib import Path
import opentimelineio as o
from generate_semantic_tests import cases, span, clip, timeline, transition
assert o.__version__ == '0.18.1'
root=Path(__file__).resolve().parents[1]
def q(v):return json.dumps(v,ensure_ascii=False)
def raw(obj):return q(json.dumps(json.loads(o.adapters.write_to_string(obj,'otio_json')),separators=(',',':'),ensure_ascii=False))
def num(n):return repr(float(n))
lines=['// Generated using tools/generate_graph_tests.py and official OTIO 0.18.1.']
for name,t in cases().items():
    for start,duration in [(0,1),(1,2),(2,2),(3,2),(0,10)]:
        track=t.tracks[0]; window=span(start,duration)
        label=f'trim {name} {start} {duration}'
        lines += ['', '///|',f'test {q(label)} {{',f'  let track = @schema.read({raw(track)}).unwrap()',f'  let result = @algorithms.track_trimmed_to_range(track, span({num(start)}, {num(duration)}))']
        try: expected=o.algorithms.track_trimmed_to_range(track,window)
        except o.exceptions.CannotTrimTransitionsError: lines += ['  assert_true(result is Err(_))','}'];continue
        lines += [f'  let expected = @schema.read({raw(expected)}).unwrap()', '  assert_true(result.unwrap().equivalent(expected))','}']
for name in ['internal','leading','trailing','both_edges']:
    track=cases()[name].tracks[0]
    expected=o.algorithms.track_with_expanded_transitions(track)
    lines += ['', '///|',f'test "expand transitions {name}" {{',f'  let track = @schema.read({raw(track)}).unwrap()', '  let result = @algorithms.track_with_expanded_transitions(track).unwrap()', f'  assert_eq(result.length(), {len(expected)})']
    for i,item in enumerate(expected):
        if isinstance(item,tuple):
            lines += [f'  match result[{i}] {{', '    @algorithms.Transition(a, b, c) => {']
            for letter,obj in zip('abc',item): lines += [f'      assert_true({letter}.equivalent(@schema.read({raw(obj)}).unwrap()))']
            lines += ['    }','    _ => fail("expected transition tuple")','  }']
        else:
            lines += [f'  match result[{i}] {{',f'    @algorithms.Item(a) => assert_true(a.equivalent(@schema.read({raw(item)}).unwrap()))','    _ => fail("expected item")','  }']
    lines += ['}']
for mode in range(4):
    bottom=o.schema.Track(children=[clip('bottom',0,10)])
    top=o.schema.Track(children=[o.schema.Gap(source_range=span(0,2)),clip('top',20,3),o.schema.Gap(source_range=span(0,1))])
    if mode==1:top.enabled=False
    if mode==2:top[1].enabled=False
    if mode==3:top.append(transition(.25,.25));top.append(clip('last',30,4))
    stack=o.schema.Stack(children=[bottom,top])
    expected=o.algorithms.flatten_stack(stack)
    lines += ['', '///|',f'test "official flatten {mode}" {{',f'  let stack = @schema.read({raw(stack)}).unwrap()',f'  let expected = @schema.read({raw(expected)}).unwrap()', '  assert_true(@algorithms.flatten_stack(stack).unwrap().equivalent(expected))','}']
for step in [1,2,3]:
    seq=o.schema.ImageSequenceReference(target_url_base='file:///frames',name_prefix='shot.',name_suffix='.exr',start_frame=-2,frame_step=step,rate=24,frame_zero_padding=4,available_range=span(10,1))
    lines += ['', '///|',f'test "official image sequence step {step}" {{',f'  let seq = @schema.ImageSequence::from_object(@schema.read({raw(seq)}).unwrap()).unwrap()',f'  assert_eq(seq.number_of_images(), {seq.number_of_images_in_sequence()})',f'  near(seq.end_frame().unwrap(), {num(seq.end_frame())})']
    for i in [0,1,seq.number_of_images_in_sequence()-1]:
        lines += [f'  assert_eq(seq.target_url({i}).unwrap(), {q(seq.target_url_for_image_number(i))})', f'  near(seq.presentation_time({i}).unwrap().to_seconds().unwrap(), {num(seq.presentation_time_for_image_number(i).to_seconds())})']
    lines += [f'  assert_eq(seq.target_url(-1).unwrap(), {q(seq.target_url_for_image_number(-1))})', '}']
for name in ['internal','nested_trimmed']:
    t=cases()[name];g=t.tracks
    lines += ['', '///|',f'test "official graph mapping {name}" {{',f'  let g = @graph.Graph::new(@schema.read({raw(g)}).unwrap())']
    def walk(node,path):
        for i,child in enumerate(node):
            p=path+[i]; r=node.range_of_child_at_index(i)
            lines.extend([f'  let r = g.range_in_parent({p}).unwrap().unwrap()',f'  near(r.start().to_seconds().unwrap(), {num(r.start_time.to_seconds())})',f'  near(r.duration().to_seconds().unwrap(), {num(r.duration.to_seconds())})'])
            if isinstance(child,o.core.Composition):walk(child,p)
            elif isinstance(child,o.schema.Clip):
                source=child.trimmed_range().start_time
                dest=child.transformed_time(source,g)
                lines.extend([f'  near(g.transformed_time(seconds({num(source.to_seconds())}), {p}, []).unwrap().to_seconds().unwrap(), {num(dest.to_seconds())})'])
    walk(g,[])
    lines += ['}']
(root/'conformance/graph_test.mbt').write_text('\n'.join(lines)+'\n',encoding='utf-8',newline='\n')
