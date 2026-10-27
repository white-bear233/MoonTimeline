# OTIO JSON 读取（0.2.0）

任意根对象使用 `schema.read`，任意 JSON 根使用 `otiojson.parse`；完整对象和媒体接口见 [模块索引](otio-modules.md)。下面说明兼容旧 API 的 Timeline 读取入口。

`otio.read(source)` 返回 `Result[model.Timeline, Diagnostic]`。
Diagnostic 包含 code、path、message；path 使用 JSON Pointer，根为 ""，键中的 ~ 和 / 分别转义为 ~0、~1。
仅解析文本，不访问媒体文件、URL 或文件系统。

解析范围：

- 容器：Timeline.1 → Stack.1 → Track.1（含历史名 Sequence.1），嵌套组合可递归出现。
- 条目：Clip.2、Clip.1（单数 `media_reference`，读入后迁移为 `DEFAULT_MEDIA`）、Gap.1。
- 资源：RationalTime.1、TimeRange.1、ExternalReference.1、MissingReference.1。
- 其它节点（Transition.1、GeneratorReference.1、Color.1 等）连同未知字段、非空 effects/markers 一起按原始 JSON 保留在模型的 `extra` 或 `Opaque` 中，写出时原样合并。

因此读取不再因为「超出计算子集」而整体失败；分档行为见 [兼容说明](compatibility.md)。

明确限制：

- Track kind 必须是 Audio 或 Video。
- Clip.2 必须提供媒体引用 map 和存在的 active key；Clip.1 允许 `media_reference` 为 null（视为无媒体）。
- Gap 必须有 source_range；Clip 可以缺省，时长未知时交由后续使用者处理。
- metadata 必须是对象，内部可保存任意 JSON；name/metadata 为 null 时按空值处理并原样写回。
- 输入上限 1600 万字符串代码单元，JSON 嵌套上限 64，拒绝重复键。
- 时间值必须有限、帧率为正、时长非负；溢出区间被拒绝。
- OTIO 数值方言（`Inf`、`-Infinity`、`NaN`）及精确整数词法无损保留；不会替换为 null。用于时间计算的字段仍要求有效有限值，元数据不受该计算约束。

错误码：invalid_json、input_limit、type、missing_field、unsupported_schema、
invalid_time、invalid_range、missing_media。
`unsupported_feature` 仅用于 Track kind 等结构性取值；未知字段与未知节点不再触发该错误。
返回第一个错误；多个错误同时存在时，不承诺 map 遍历顺序。

测试直接来自已提交的官方 OTIO 样例，使用 Python 生成可在 JS/Native/Wasm GC 执行的 MoonBit 黑盒测试。
`python tools/generate_reader_tests.py` 后执行 `moon fmt` 可重新生成；CI 检查生成文件无差异。
已有正常路径测试检查素材起点 10 秒与 Gap 时长 2 秒，避免将 source 与 placement 混用。
序列化、布局和编辑已分别在第 7、8、10 步实现，详见 writer.md、layout.md、edit.md。
`tools/check_external_corpus.mjs` 对上游 sample_data 做可读/可计算/可写回三层回归。
