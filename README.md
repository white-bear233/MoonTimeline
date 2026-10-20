# MoonTimeline

用 MoonBit 原生实现的剪辑时间线基础库，提供 [OpenTimelineIO (OTIO)](https://github.com/AcademySoftwareFoundation/OpenTimelineIO) 的明确子集：读取、导出、布局计算、结构化诊断与基础编辑。

它操作的是「视频怎么剪」的时间线数据，不负责视频编解码、播放或渲染，也不在运行时调用 Python / C++ 的 OTIO。

## 能力

- **严格读取**：受限 OTIO JSON 子集，错误带字段路径；遇到转场、效果、复杂嵌套等超范围语义显式拒绝，不静默丢数据。
- **语义导出**：导出的工程由官方 OTIO 0.18.1 读取验证，往返后 JSON 完整一致。
- **时间与区间**：`RationalTime`（value/rate 双精度）、帧率转换不偷偷取整、舍入策略由调用者选择；半开区间、交集、裁剪。
- **布局与查询**：轨道累计位置、工程总时长（取最长轨道）、时间点查询、素材位置映射。
- **诊断**：区分确定错误、警告与信息不足，素材可用范围缺失只提示无法验证，不误报越界。
- **原子编辑**：拆分、顺移裁剪、插入 Gap；成功返回独立工程，失败时原工程保持不变。

当前 164 项 MoonBit 测试在 JS 与 Wasm GC 上通过，Native 由 Linux CI 覆盖。

## 安装

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
| `time` | RationalTime、秒数、帧率转换、显式舍入 |
| `range` | 半开区间、交集、裁剪、边界检查 |
| `model` | Timeline / Stack / Track / Clip / Gap / 媒体引用 |
| `otio` | OTIO JSON 子集读写与诊断 |
| `timeline` | 轨道布局、时长、时间点与素材位置查询 |
| `validate` | 结构化诊断（错误 / 警告 / 未知） |
| `edit` | 拆分、顺移裁剪、插入 Gap |
| `cmd` | 命令行入口，共享 MoonBit 操作接口 |
| `demo` | 浏览器演示（导入、编辑、撤销、下载） |

## 命令行与浏览器演示

```sh
node tools/build-js.mjs
node cmd/moontimeline.mjs inspect fixtures/valid/gap_clip.otio
node tools/serve.mjs   # http://127.0.0.1:4173/demo/index.html
```

命令 `inspect`、`validate` 输出 JSON；`export`、`split`、`trim`、`gap` 必须提供 `--output`，且拒绝覆盖已有文件。退出码：0 成功（含警告），1 校验发现确定错误，2 参数 / 读取 / 解析 / 编辑 / 写入失败。细节见 [命令行](docs/cli.md) 与 [演示](docs/demo.md)。

## 兼容边界

- 参考上游固定为 v0.18.1（commit `44236713c1db295a6ffc66189ae98dbdfd0cb9c4`，Apache-2.0）。
- 支持 `RationalTime.1`、`TimeRange.1`、`Timeline.1`、`Stack.1`、`Track.1`、`Clip.2`、`Gap.1`、`ExternalReference.1`、`MissingReference.1` 的受限子集。
- 不支持转场、变速效果与复杂嵌套；遇到即报错，不做有损转换。
- 样例由 `tools/oracle.py` 原创构造，媒体路径均为占位符，不含真实视频。

详见 [兼容说明](docs/compatibility.md) 与 [读取限制](docs/reader.md)。

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
```

14 个开发里程碑与每步验收见 [开发计划](docs/development.md)，逐次验证记录见 [验证记录](docs/validation.md)。每个里程碑单独提交，不用空提交凑数量。

## 许可证

Apache-2.0，见 [LICENSE](LICENSE)。数据模型与运算行为参考 OpenTimelineIO（Apache-2.0），未复制上游源代码。
