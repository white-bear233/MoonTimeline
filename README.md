# MoonTimeline

MoonBit 原生剪辑时间线基础库，计划实现 OpenTimelineIO (OTIO) 的明确子集。
当前处于开发早期，不是完整 OTIO 移植，不提供视频编解码、播放或渲染。

## 开发环境

- MoonBit `0.1.20261016` / moonc `v0.10.16+b1a0e846e`（安装版本 `0.10.16+b1a0e846e`）
- Node.js 22；Python 3.11（仅对照测试使用）
- Git

安装 MoonBit：https://www.moonbitlang.com/download/

在项目根目录运行：

```sh
moon fmt --check
moon check --target js
moon build --target js
moon test --target js
moon test --target native
```

CI 在 Linux 上验证 JS 和 Native；Windows 本地环境另行记录验证结果。

## 开发范围与进度

模块边界、14 个开发里程碑及每步验收见 [开发计划](docs/development.md)。
每个里程碑通过检查后单独提交，不通过空提交凑数量。
当前提供受限 OTIO JSON 读取；尚未提供导出、编辑、CLI 或浏览器演示。

已完成前 6 个里程碑：工程初始化、OTIO 0.18.1 对照样例、时间计算、半开区间、时间线模型、OTIO JSON 读取。
时间模块用法与边界见 [时间 API](docs/time.md)，上游范围见 [兼容说明](docs/compatibility.md)。

```sh
moon run examples/time --target js
python tools/generate_time_tests.py --check
```

Python 对照验证请先安装 `tools/requirements.txt`，再运行 `python tools/oracle.py --check`。
产品库本身不需要 Python。

## 许可证与参考

Apache-2.0，见 [LICENSE](LICENSE)。
格式与行为参考 [OpenTimelineIO](https://github.com/AcademySoftwareFoundation/OpenTimelineIO)，
该项目采用 Apache-2.0。本项目为独立 MoonBit 实现，不在运行时调用 Python/C++ OTIO。

新增模块文档：[区间](docs/range.md)、[模型](docs/model.md)、[读取与错误诊断](docs/reader.md)。
