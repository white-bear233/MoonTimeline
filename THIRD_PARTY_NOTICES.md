# 第三方项目与许可

- **OpenTimelineIO v0.18.1**，Academy Software Foundation，Apache-2.0。
  源码：https://github.com/AcademySoftwareFoundation/OpenTimelineIO/tree/v0.18.1 。
  MoonTimeline 独立用 MoonBit 重写相关能力；公开 schema、默认对象、时间与算法结果作为互操作测试依据。
  Python OTIO 仅为开发/CI 对照依赖，不进入产品运行时。上游样例下载到忽略目录用于验证。
- **moonbit-community/flate 0.9.0**，Apache-2.0。
  源码：https://github.com/moonbit-community/flate 。
  作为运行时依赖提供纯 MoonBit ZIP/DEFLATE；本项目实现 OTIOZ/OTIOD 文档、媒体策略和路径检查。
  安装包随依赖分发原许可证，不将压缩算法标为本项目原创。

MoonTimeline 自身代码许可证见 [LICENSE](LICENSE)。
