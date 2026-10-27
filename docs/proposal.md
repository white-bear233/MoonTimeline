# MoonTimeline 项目申报书（本轮初审意见修订版）

**基本信息**：参赛者〔待填〕；联系方式〔待填〕。

**1．项目名称**：MoonTimeline——MoonBit 原生 OpenTimelineIO 剪辑时间线库。

**2．项目简介**：用 MoonBit 实现剪辑工程的读取、交换、时间计算、校验与编辑，为 MoonBit 应用接入影视后期工作流提供基础库。运行时不依赖 Python/C++ OTIO；编解码与视频渲染交给外部工具。以 **OTIO v0.18.1 完整公开能力**为建设目标，当前已完成部分功能并持续补齐，不将核心子集作为最终范围。

**3．项目方向与通用性**：媒体工程数据基础设施。提供独立于界面及文件系统的 MoonBit API，适用于 CLI、Web 与原生工具，可供剪辑器、审片系统、自动质检和批处理服务复用。

**4．预期使用场景**：

1. **交付质检**：导入含多轨、转场和变速片段的 OTIO → 检查相邻约束、转场所需素材余量与素材越界 → 输出带字段路径的诊断报告；信息不足明确提示，供交付人员核查。
2. **批量整理工程**：输入混合帧率、嵌套时间线 → 按路径拆分、裁剪或插入空隙，同步更新变速后的素材起点 → 保留标记、元数据及媒体引用并导出，交回原有后期工具链。
3. **浏览器审片辅助**：本地载入 OTIO → 查看片段布局，调用时间线 API 获取转场区间和素材坐标，进行基础编辑及撤销 → 下载新工程；核心计算在浏览器内完成。

**5．核心功能与完整实现计划**：

- 已实现：基础时间/区间、OTIO 读写、嵌套与裁剪、转场完整及可见范围/相邻约束、片段线性变速/倒放/定格映射、原子编辑。Marker 坐标及 Metadata、Effects、扩展字段在编辑后保留并独立复制，禁止静默丢数据。
- 后续按阶段覆盖：全部 OTIO schema（含图像序列、生成素材、Marker、Effect、对象集合）、完整 opentime/core 与算法、组合变速和嵌套转场余量、版本迁移及特殊数值无损读写、otio_json/otioz/otiod 和插件机制。以官方差分测试、完整字段往返及三后端回归逐项验收，清单见 [完整实现路线图](https://github.com/white-bear233/MoonTimeline/blob/main/docs/otio-roadmap.md)。

**6．项目性质**：参考已有开源项目的独立 MoonBit 重写；不是简单封装上游运行库。

**7．参考与许可**：[OpenTimelineIO v0.18.1](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/tree/v0.18.1)，Apache-2.0；本项目同为 Apache-2.0，现有代码独立实现，未复制上游源码。

**8．仓库与有效提交**：[white-bear233/MoonTimeline](https://github.com/white-bear233/MoonTimeline)。本轮修订前已有 21 次提交，涵盖模型、读写、计算、编辑、工具、测试及文档，超过 10 次要求；本轮增加实际语义修复、回归验证及完整实施计划，不以空提交、重复或无意义拆分凑数。[提交历史](https://github.com/white-bear233/MoonTimeline/commits/main/)。
