# MoonTimeline

用 MoonBit 原生实现的剪辑时间线基础库，以 [OpenTimelineIO v0.18.1](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/tree/v0.18.1) 的完整公开能力为目标，按阶段交付模型、交换格式、时间计算、诊断和编辑。**当前尚未完成完整 OTIO 兼容**，完整范围及验收标准见 [路线图](docs/otio-roadmap.md)。

它操作的是「视频怎么剪」的时间线数据，不负责视频编解码、播放或渲染，也不在运行时调用 Python / C++ 的 OTIO。

## 能力

- 时间、区间和变换：RationalTime / TimeRange / TimeTransform、SMPTE/drop-frame、时间字符串及区间关系。
- 标准对象：33 种 schema/时间/空间值，任意根与对象集合，Marker、Effect、图像序列、生成器、颜色与图像边界。
- 对象图与播放：父子路径、查询、结构坐标转换；嵌套 Track/Stack 变速、倒放和定格，转场范围、相邻约束及递归素材余量。
- 编辑与算法：split/trim/gap、直接编辑转场，以及上游全部 7 个公开 algorithms 入口；字段和原工程独立保留。
- 无损交换：未知字段/类型、NaN/Inf、精确数值词法、旧 schema 升级及显式版本降级。
- 内置适配器：OTIO JSON、OTIOZ、OTIOD，媒体打包、路径重定位、压缩和输入边界检查。
- 扩展机制：适配器、四类钩子、媒体链接器、自定义 schema、版本清单、插件 Manifest 和宿主发现回调。

本轮 7,193 项 MoonBit 测试（含 6,703 个生成用例，区分官方差分、宿主适配和危险输入防护）；官方时间/算法差分、21 个实际编辑导出、13 个上游样例和 OTIOZ/OTIOD 双向互读均纳入验证。各模块入口、证据和差异见 [模块索引](docs/otio-modules.md)；最新三后端执行结果见 [验证记录](docs/validation.md)。逐 API 覆盖和适配边界见 [差分报告](docs/api-conformance.md)。这些结果不等于上游全部 API 已完成兼容认证。

## 安装

本轮仓库修订为 0.2.0，尚未发布到 Mooncakes；`moon add` 获取已发布版本，本轮功能请先使用仓库源码验证。

```sh
moon add white-bear233/moontimeline
```

在 `moon.pkg` 中按需引入子包：

```
import {
  "white-bear233/moontimeline/time" @timeline_time,
  "white-bear233/moontimeline/otio",
}
```

```mbt
///|
fn main {
  let time = @timeline_time.RationalTime::new(48.0, 24.0).unwrap()
  let converted = time.rescaled_to(30.0).unwrap()
  println("48 帧 @ 24fps = \{time.to_seconds().unwrap()} 秒")
  println("换算到 30fps = \{converted.value()} 帧")
}
```

读取一个 OTIO 工程：

```mbt
let result = @otio.read(json_text)
match result {
  Ok(timeline) => println(@otio.write(timeline).unwrap())
  Err(diagnostic) =>
    println("读取失败 \{diagnostic.code} @ \{diagnostic.path}: \{diagnostic.message}")
}
```

## 模块

| 包 | 职责 |
|---|---|
| `time` / `range` / `transform` | 时间、区间关系、时码与坐标变换 |
| `schema` / `graph` | 标准对象、字段/媒体/标记 API、不可变对象图 |
| `algorithms` | 7 个上游公开算法入口 |
| `otiojson` | OTIO 数值方言、任意根、无损词法、深复制 |
| `adapters` / `plugins` | OTIOZ/OTIOD、媒体包、插件与版本清单 |
| `model` / `otio` | 兼容原有 Timeline 编辑入口 |
| `timeline` / `validate` | 布局、播放映射、转场和素材约束 |
| `edit` | 拆分、裁剪、Gap 与转场编辑 |
| `cmd` / `demo` | 文件命令行与浏览器演示 |

## 命令行与浏览器演示

```sh
node tools/build-js.mjs
node cmd/moontimeline.mjs inspect fixtures/valid/gap_clip.otio
node tools/serve.mjs   # http://127.0.0.1:4173/demo/index.html
```

命令 `inspect`、`validate` 输出 JSON；`export`、`split`、`trim`、`gap` 必须提供 `--output`，且拒绝覆盖已有文件。退出码：0 成功（含警告），1 校验发现确定错误，2 参数 / 读取 / 解析 / 编辑 / 写入失败。细节见 [命令行](docs/cli.md) 与 [演示](docs/demo.md)。

## 兼容边界

参考上游固定为 v0.18.1（commit `44236713c1db295a6ffc66189ae98dbdfd0cb9c4`，Apache-2.0）。模块已有实现，**尚未完成上游整套测试逐例迁移及逐成员异常行为认证**，不标称 100% OTIO 兼容。

`schema`/`graph` 使用不可变对象与路径表达父子关系；计算类型以 `Result` 拒绝无效时间哨兵，序列化层保留特殊数值。结构坐标变换与播放映射分别提供。未知时间曲线只保留，不猜测；外部媒体可用范围不明时给出提示。

新文件归档命令由 Node 宿主连接纯 MoonBit 核心；Native 文件 CLI 保留原有命令集。已有 Python 插件需桥接或重写回调，第三方 AAF/FCPXML/EDL 和编解码不属于本轮内置模块。

详见 [兼容说明](docs/compatibility.md)、[API 与验收索引](docs/otio-modules.md) 和 [第三方许可](THIRD_PARTY_NOTICES.md)。

## 外部语料与规模

```sh
node tools/check_external_corpus.mjs   # 显示支持项与拒绝项，不等同于完整兼容
node tools/bench.mjs                   # 1k / 5k / 10k / 20k 片段的解析、校验、导出耗时
```

## 开发与验证

```sh
moon fmt --check
moon check --target js
moon build --target js
moon test --target js
moon test --target wasm-gc
node tools/build-js.mjs
node --test tests/cli.test.mjs tests/regression.test.mjs
python tools/oracle.py --check        # 需要 .venv 中的 opentimelineio 0.18.1
python tools/check_review.py          # 实际编辑输出与完整字段保留
```

14 个开发里程碑与每步验收见 [开发计划](docs/development.md)，逐次验证记录见 [验证记录](docs/validation.md)。每个里程碑单独提交，不用空提交凑数量。

## 许可证

Apache-2.0，见 [LICENSE](LICENSE)。数据模型与运算行为参考 OpenTimelineIO（Apache-2.0），未复制上游源代码。
