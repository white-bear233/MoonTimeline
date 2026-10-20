# OTIO JSON 读取（第 6 步）

`otio.read(source)` 返回 `Result[model.Timeline, Diagnostic]`。
Diagnostic 包含 code、path、message；path 使用 JSON Pointer，根为 ""，键中的 ~ 和 / 分别转义为 ~0、~1。
仅解析文本，不访问媒体文件、URL 或文件系统。

支持固定 schema：Timeline.1 → Stack.1 → Track.1 → Clip.2 / Gap.1，
及 RationalTime.1、TimeRange.1、ExternalReference.1、MissingReference.1。
多个音视频轨道、所有媒体引用、active key、source_range、available_range、global_start_time、
名称、metadata、enabled、color 被保留。available_image_bounds 作为不解释的 Json 保留。
MissingReference 或缺失可用范围不等于文件不存在，也不报媒体越界。

明确限制：
- 不支持嵌套 Stack/Track、Transition、非空 effects/markers、非空容器 source_range。
- 未知字段和 schema 版本显式拒绝，不能静默丢掉可能影响语义的信息。
- Track kind 必须是 Audio 或 Video；Clip.2 必须提供媒体引用 map 和存在的 active key。
- Gap 必须有 source_range；Clip 可以缺省，时长未知时交由后续使用者处理。
- metadata 必须是对象，内部可保存任意 JSON。字段类型严格检查。
- 输入上限 400 万字符串代码单元，JSON 嵌套上限 64，拒绝重复键。
- 时间值必须有限、帧率为正、时长非负；溢出区间被拒绝。

错误码：invalid_json、input_limit、type、missing_field、unsupported_schema、
unsupported_field、unsupported_feature、invalid_time、invalid_range、missing_media。
返回第一个错误；多个错误同时存在时，不承诺 map 遍历顺序。

测试直接来自已提交的官方 OTIO 样例，使用 Python 生成可在 JS/Native/Wasm GC 执行的 MoonBit 黑盒测试。
`python tools/generate_reader_tests.py` 后执行 `moon fmt` 可重新生成；CI 检查生成文件无差异。
已有正常路径测试检查素材起点 10 秒与 Gap 时长 2 秒，避免将 source 与 placement 混用。
此阶段不提供序列化、布局总时长或编辑，分别属于第 7、8、10 步。
