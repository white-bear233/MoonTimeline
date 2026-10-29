# 0.2.0 模块与验收索引

参考 OTIO v0.18.1，固定提交 `44236713c1db295a6ffc66189ae98dbdfd0cb9c4`。本轮补齐下面各层的实现和可调用入口，运行时不依赖 Python/C++ OTIO。**模块覆盖不等于上游全部 API 与异常行为已完成逐项兼容认证**。

| 层 | MoonBit 入口与能力 | 验证依据 |
|---|---|---|
| opentime | `time`：帧率、算术、比较、舍入、SMPTE/drop-frame/时间字符串；`range`：区间关系、包含、交并、端点；`transform`：应用、组合、逆变换 | 140 个官方时间/区间/变换差分用例；时间字符串边界测试 |
| schema/core | `schema.Object`：33 种标准对象/时间/空间值的构造、字段校验、版本、深复制、等价、未知类型；字段通过 `get/with_field` 访问 | 官方默认对象逐一往返；21 组必需字段错误测试；`schema/object_test.mbt` |
| 对象图 | `graph.Graph`：父子路径、不可变插入/替换/移除、遍历、范围、handles/neighbors、坐标转换、时间/区间搜索、图像边界 | `conformance/graph_test.mbt`、`objects_test.mbt`；图查询补充回归 |
| 媒体 | External/Missing/Generator/ImageSequence；活动引用切换；生成器参数；序列 URL、抽象 URL、帧号、步长、时间范围；Box2d | 官方步长 1/2/3 图像序列差分、媒体键和溢出测试 |
| Marker/Effect/空间 | Marker 增删改查与父坐标映射；Effect、TimeEffect、LinearTimeWarp、FreezeFrame；Color/V2d/Box2d 编码、颜色转换、向量运算 | 属性独立性、标记点边界、颜色字节序、空间操作测试 |
| 播放语义 | `timeline`：嵌套 Track/Stack 倍率传播、倒放端点、定格；转场完整/可见范围和相邻片段限制 | `composition_retime_test.mbt`、`review_test.mbt` |
| 编辑与校验 | `edit`：split/trim/gap、转场插入/删除/offset 更新；`validate`：递归媒体余量、未知范围提示；Metadata/Marker/Effects 保留 | 21 个实际编辑导出由官方读取；原子性与循环对象回归 |
| 官方 algorithms | `track_trimmed_to_range`、`timeline_trimmed_to_range`、`track_with_expanded_transitions`、`flatten_stack`、`top_clip_at_time`、`filtered_composition`、`filtered_with_sequence_context` | 60 个裁剪、4 个转场展开、4 个 flatten 官方差分及过滤/查询测试 |
| 序列化与迁移 | `otiojson`：任意根、NaN/Inf、精确数值词法；`schema`：Marker/Clip/Sequence 迁移；`plugins`：版本清单及自定义 schema 升降级 | 特殊值、未知字段、嵌套 Clip 降级、官方往返测试 |
| 适配器 | `adapters`：OTIOZ/OTIOD、ZIP/DEFLATE、媒体三种策略、URL 重定位、路径/体积/重复项边界 | `check_bundles.py` 官方双向互读，中文和空格路径、媒体字节及路径逃逸测试 |
| 插件 | `plugins.Registry`：适配器、媒体链接器、四类钩子、自定义 schema、版本清单、Manifest 原子加载、宿主文件发现 | 回调顺序、注册冲突、失败不污染注册表、嵌套版本测试 |
| core_api / URL | 任意 JSON 根序列化、schema 实例化、固定上游版本表；POSIX/Windows URL 转换 | 模块级函数差分、81 次真实文件互读 |
| 文件/CLI | Node 宿主连接 MoonBit：转换、打包/解包、flatten/filter/find/trim-range/展开转场；原有 inspect/validate/编辑命令保留 | 文件覆盖保护、官方互读、原有 8 项 CLI/回归 |

所有公开签名由 `moon info` 生成在各包的 `pkg.generated.mbti`。上游类/成员清单在 [otio-api-inventory.json](otio-api-inventory.json)，由 `python tools/audit_api.py --check` 检查；清单列出成员不代表其已全部测试。

## MoonBit API 的表达方式

- 可变 Python 对象及 parent 指针改为不可变对象值和 Graph 路径。`children()` 返回独立数组，列表的 append/extend/reverse/count/index 等操作使用 MoonBit Array，再通过 `with_children` 或 Graph 操作提交。重复挂接会产生独立副本；不会共享一个可变子对象。
- 所有标准 schema 的数据字段均可通过 `Object.get/with_field` 访问；Marker、Effect、ImageSequence、Color、Box2d 等另有类型化接口。未知字段完整保留，未知类型不猜测时长或播放效果。
- 新增 `opentime` 兼容类型保留官方无效时间、特殊浮点和负区间；原有 `time/range/transform` 是严格编辑类型，拒绝无效/非有限时间和负时长。异常通过 `Result` 表达，已验证失败路径与副作用，但不承诺所有 Python 异常类及消息逐字一致。
- 上游结构坐标转换忽略 TimeEffect；`graph` 保持该语义。`timeline` 的播放映射是本库明确的扩展契约：以 source_start 为锚点，启用的线性效果依次相乘；未知时间曲线返回无法求值。展示时长保持 OTIO 的 source_range.duration。
- 倒放布局包含方向可能为 `(start,end]`，通过 `start_inclusive/end_inclusive` 和查询 API 表达。定格中的转场没有唯一切点，`cut_seconds=None`，CLI 输出 null。
- `Registry.discover` 接收宿主提供的路径、读取回调及 Resolver；不直接执行清单中的 Python 脚本。已有 Python 插件需要宿主桥接或 MoonBit 实现。`Plugin` 提供懒加载/反射和完整的 `read_document/write_document` 参数协议；`ManifestContext` 提供宿主局部缓存，`PluginIO` 明确承接文件、Hook 和媒体链接器。

本轮逐 API 差分和覆盖缺口见 [差分报告](api-conformance.md)，包含 6,703 个生成用例、777 个入口的证据或绑定边界。

## 当前验收边界

本轮达到各模块可调用、定向差分及回归通过。尚未逐例移植上游整套测试、逐成员建立合法/边界/异常三类差分，也未认证所有真实剪辑软件导出的工程。不得据此宣传“100% OTIO 兼容”。

`otio`/`model` 保留较严格的 Timeline 编辑入口（例如 Track.kind 为 Audio/Video）；任意标准根对象与扩展字段通过新的 `schema`/`otiojson`/`graph` 使用。第三方 AAF/FCPXML/EDL 插件和视频编解码不属于 OTIO 主仓库内置模块范围。

核心三个编译目标均由 CI 验证；新文件归档命令在 Node 宿主执行，Native 文件 CLI 目前仍是原有命令集。归档核心在 Native/Wasm GC 可通过宿主文件回调使用。本轮验收版本固定为 0.2.0；包安装和源码复现步骤见仓库 README。
