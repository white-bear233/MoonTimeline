# OTIO 完整实现范围与验收路线

目标固定为 OpenTimelineIO v0.18.1 的公开能力（commit `44236713c1db295a6ffc66189ae98dbdfd0cb9c4`），运行时不依赖 Python/C++ OTIO。完整目标始终包含下面各层，不以时间线核心子集作为最终交付范围。

## 本轮模块交付

| 计划层 | 0.2.0 状态 |
|---|---|
| opentime | time/range/transform、时间字符串、SMPTE/drop-frame、区间关系和变换已实现 |
| 完整对象与 schema | 33 种标准对象/值类型、任意根、集合、Marker/Effect/媒体/空间 API、字段检查及旧版迁移已实现 |
| core 对象图 | 不可变所有权、父子路径、范围/handles/neighbors、查询和结构转换已实现 |
| 播放与编辑 | 嵌套组合变速、倒放/定格边界、递归转场余量、转场编辑和原有编辑操作已实现 |
| algorithms | 上游 7 个公开算法入口均已实现；包括两种过滤算法 |
| 序列化/版本 | 特殊数值、整型词法、未知类型、schema 注册和版本清单已实现 |
| 内置适配器 | otio_json、OTIOZ、OTIOD 及媒体策略已实现，官方双向互读已测试 |
| 扩展与工具 | Adapter/HookScript/MediaLinker/SchemaDef/PluginManifest 接口、宿主发现、文件转换与算法 CLI 已实现 |

实现路径、测试证据和适配方式见 [模块索引](otio-modules.md)，上游完整类/成员盘点见 [API 清单](otio-api-inventory.json)。不可将 JSON 原样保留计为算法实现，也不可把清单中出现一个成员当成已验证。

## 完整兼容验收仍须持续执行

本轮完成模块落地与定向验证；完整 OTIO 兼容认证不因模块齐全自动完成。下一道验收门槛是：

1. 对 API 清单的每个成员分别登记合法、边界、异常输入，迁移或对照上游完整测试；已有结果不足的项继续补证据，发现差异则修正或明确记录适配理由。
2. 将默认对象测试扩展到每种 schema 的非默认值、历史版本、扩展字段及真实软件导出；不能仅统计默认值往返。
3. 在三种核心后端持续检查数字边界、深层结构、转场/变速/混合帧率组合；文件适配层标明支持宿主，不能把 Node 文件测试当作 Native CLI 文件测试。
4. 保持媒体包路径与体积限制、插件回调隔离和版本降级的数据损失提示；增加大工程与真实媒体互操作验证。
5. 对发布候选执行打包检查，发布 Mooncakes 后从注册表安装到空项目并验证整改功能。本轮验收指定 0.2.0，不把旧版包下载量或测试当成新版发布证据；独立安装流程通过 `tools/check_published.py` 复现。

满足这些门槛前，对外表述为“完整 OTIO 范围下的 MoonBit 实现，模块已落地、兼容性持续验收”，不使用“全部上游测试通过”或“100% 兼容”。

已有 Python 插件通过宿主桥接或 MoonBit 重写提供；第三方 otio-plugins 的 AAF/FCPXML/EDL 另作互操作扩展，不属于 OTIO 主仓库三个内置适配器。视频编解码和渲染不属于 OTIO 本身职责。

依据：[上游 v0.18.1 源码与测试](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/tree/v0.18.1)、[时间线与转场](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/blob/v0.18.1/docs/tutorials/otio-timeline-structure.md)、[序列化 schema](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/blob/v0.18.1/docs/tutorials/otio-serialized-schema.md)。
