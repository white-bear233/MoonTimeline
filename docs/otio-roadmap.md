# OTIO 完整实现路线图与验收边界

目标是以 **MoonBit 原生实现 OpenTimelineIO v0.18.1 的完整公开能力**，不是把当前时间线子集作为最终交付范围。参照上游固定提交 `44236713c1db295a6ffc66189ae98dbdfd0cb9c4`；运行时不调用上游 Python/C++。当前版本是分阶段实现，**尚未完成完整 OTIO 兼容**。

“完整”以固定版本的公开 schema、opentime/core/schema/algorithms API、序列化与版本迁移、内置适配器和插件机制为验收清单；用 MoonBit API 表达对应行为，不照搬 Python/C++ ABI。第三方 `otio-plugins` 中的 AAF、FCPXML、EDL 等另设互操作计划，不把第三方所有插件等同于 OTIO 主仓库内置能力。视频编解码和渲染不属于 OTIO 本身职责。

## 完整覆盖清单

| 领域 / 固定版本对象 | 当前状态 | 完整实现交付与验收 |
|---|---|---|
| RationalTime、TimeRange、TimeTransform | 前两者基础运算已实现；TimeTransform 未实现 | 全部时间转换、比较、区间关系、时码解析/格式化、drop-frame、有效帧率、变换组合/逆变换；逐 API 对照官方结果与异常 |
| SerializableObject、SerializableObjectWithMetadata、UnknownSchema | JSON 保留，未建立完整对象协议 | 对象注册、类型/版本查询、等价性、深复制、未知类型保留、任意合法根对象与对象集合序列化 |
| Composable、Item、Composition | 当前用枚举及 Track/Stack 结构表达，API 不齐 | 父子所有权、循环/重复挂接检查、索引和遍历、递归查找、父子坐标变换、range/trimmed_range/visible_range、handles/neighbors |
| Timeline.1、Stack.1、Track.1、Clip.2、Gap.1、Transition.1 | 已读写、嵌套裁剪、布局；Transition 有类型视图和时间范围 | 完整构造/修改/查询接口；转场直接编辑、嵌套组合转场的递归素材余量、全部窗口与边界组合 |
| MediaReference.1、ExternalReference.1、MissingReference.1、GeneratorReference.1、ImageSequenceReference.1 | 前三者部分实现；后两者保留原始 JSON | 图像序列帧号/URL/缺帧策略，生成素材参数，多媒体引用选择与更新、完整 available_range/available_image_bounds 语义 |
| Effect.1、TimeEffect.1、LinearTimeWarp.1、FreezeFrame.1 | 单片段线性变速/倒放/定格映射已实现；未知时间效果拒绝计算 | 类型化访问与编辑；Track/Stack 变速的递归坐标传播、复合效果明确求值策略；保留 OTIO 结构变换与播放映射的区别，不凭空赋予通用 TimeEffect 曲线含义 |
| Marker.2（及历史版本）、Metadata、Color、空间边界类型 | 原始字段保留；编辑后独立复制，不删范围外标记 | Marker 类型化增删改查、宿主/父坐标查询、范围筛选；历史 schema 升降级，颜色和空间类型完整编码，深层扩展字段完整保留 |
| SerializableCollection.1 | 未实现根集合接口 | 多 Timeline/Clip/Media 对象集合的构造、检索、完整读写 |
| OTIO JSON、schema version manifest | 当前 Timeline 根、部分旧格式升级；拒绝特殊浮点值 | 全部注册类型与任意根对象、版本化编码/升级/降级、未知 schema、整型精度、特殊 `Inf`/`NaN` 值无损读写；禁止以 null 替代数据 |
| algorithms | 基础拆分、裁剪、插入 Gap；不是完整上游算法集 | 全面盘点并迁移官方公开算法，包括 track_trimmed_to_range、track_with_expanded_transitions、flatten_stack、top_clip_at_time、timeline_trimmed_to_range；同时验证原输入不变及标记/效果/Metadata 保留 |
| Adapter.1、HookScript.1、MediaLinker.1、SchemaDef.1、PluginManifest.1 | 尚无插件机制 | MoonBit 的插件注册/发现/配置、读写钩子、媒体链接、schema 注册与清单；公开能力等价，宿主脚本执行放在适配层 |
| 内置 otio_json、otioz、otiod 与命令行 | JSON Timeline 读写与基础 CLI | JSON 任意对象、OTIOZ 压缩包、OTIOD 目录包及媒体路径重定位；输入边界/路径逃逸防护、媒体包往返，官方工具互读；CLI 支持检查/转换/过滤/组合等对应能力 |

以上是产品范围，不是“已实现”清单；保留原始 JSON 不计为类型或算法的完整实现。上游注册表中的测试专用 `Test` 类型用于测试，不属于产品 schema。

## 分阶段开发与退出条件

1. **本轮审核整改**：补转场范围与相邻约束、片段变速素材映射、编辑后的字段保留与独立性、嵌套非零窗口；修正会悄悄丢 Metadata 的读取策略。用真实导出和官方 OTIO 对照，见 [整改记录](review-response.md)。
2. **完整 schema 与序列化**：完成上表所有数据类型、任意根对象、Marker/Media/Effect 类型化接口、版本迁移及特殊数值。每种 schema 至少覆盖默认值、非默认值、元数据、未知字段、历史版本和官方双向往返；特殊数值用数值类别和原始字段验证，不能用普通 JSON 等号代替。
3. **完整对象图与时间语义**：完成 opentime、父子关系和组合查询/变换；补齐嵌套组合变速与转场余量求值。把所有公开函数逐一登记到 API 覆盖表；每个函数具备合法、边界及错误输入的官方差分测试。
4. **算法与编辑**：完成官方 algorithms、素材引用操作和 Marker 编辑；在多轨、嵌套、混合帧率、转场、变速组合中验证时长、素材映射与信息保留。未知自定义效果必须明确返回“无法求值”，不能当作 1 倍速。
5. **适配器与扩展机制**：完成三种内置适配器和插件接口。OTIOZ/OTIOD 必须由官方实现解包读取并反向验证；已有 Python 插件不宣称能在 MoonBit 中直接运行，按接口提供宿主桥接或 MoonBit 插件实现。
6. **完整兼容验收与发布**：完成逐项 API/schema/算法覆盖报告；上游相关测试逐例迁移或对照，记录平台差异与理由；核心清单不得留下“未实现”后仍标称完整。JS/Native/Wasm GC 核心测试通过；适配层在支持的平台执行文件、打包、插件测试；发布包做空项目独立安装测试。

每阶段按真实模块提交实现、测试与文档；不以拆空提交或增加样例数量替代功能验收。后续升级上游版本时单独审计新增/变更行为。

## 依据

- [OTIO v0.18.1 源码及公开测试](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/tree/v0.18.1)
- [时间线结构、转场与相邻限制](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/blob/v0.18.1/docs/tutorials/otio-timeline-structure.md)
- [Marker 与时间坐标](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/blob/v0.18.1/docs/tutorials/time-ranges.md)
- [序列化 schema](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/blob/v0.18.1/docs/tutorials/otio-serialized-schema.md)
- [OTIO 文件格式及特殊数值](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/blob/v0.18.1/docs/tutorials/otio-file-format-specification.md)
