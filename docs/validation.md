# 前三步验证记录

验证日期：2026-10-20（Asia/Shanghai）。

环境：Windows x64；moon 0.1.20261016，moonc v0.10.16+b1a0e846e；
Python 3.11 + OpenTimelineIO 0.18.1。版本安装地址已确认可访问。

| 范围 | 结果 |
|---|---|
| 格式检查、公开 API 生成 | 通过 |
| JS 检查 / 构建 / 测试 | 109 项测试通过 |
| Wasm GC 检查 / 构建 / 测试 | 109 项测试通过 |
| 官方 OTIO 固定样例重新验证 | 5 份产物一致 |
| 自动生成对照测试与已提交文件比较 | 一致 |
| JS 可运行例子 | 48@24 → 2 秒 → 60@30；-1.5 → -2 |
| Windows Native | 缺 MSVC C++ Build Tools / Windows SDK，未通过本机运行验证 |
| GitHub Actions | 已配置 Linux JS / Native / Wasm GC + Python oracle，尚未远程执行 |

第 1、2 步尚无 MoonBit 行为实现，因此当时的 MoonBit 测试数是 0；
第 2 步实际运行官方 OTIO 生成与校验，第 3 步新增 102 个对照测试和 7 个边界行为测试。

不应将已配置 CI 描述成远程 CI 已通过。当前也尚未发布 Mooncakes，未完成完整比赛验收。


# 第 4～6 步验证记录

- 第 4 步：区间、交集与裁剪，本地 JS / Wasm GC 各 113 项测试通过。
- 第 5 步：时间线与媒体模型，各 117 项测试通过。
- 第 6 步：OTIO 读取器与诊断，各 141 项测试通过；全部检查与构建通过。
- OTIO 基线验证、时间对照测试生成验证通过；读取器测试重新生成并格式化后文件完全一致。
- 第 4、5 步 GitHub Actions 已通过，包括 Linux Native。
- 第 6 步远程结果以仓库 Actions 中对应提交的运行记录为准。
- Windows Native 仍需 MSVC，本次没有安装该大型组件；Linux Native 由 CI 验证。

读取器测试覆盖官方正常工程、素材与轨道坐标区分、MissingReference、未知时长、
非法 JSON、重复键、深度限制、未来 schema、未知字段、嵌套对象、转场、效果、标记、
容器裁剪、非法帧率、负时长、错误类型、缺失字段、active key 和 JSON Pointer 转义。


# 第 7～10 步验证记录

- 第 7 步：144 项测试，真实导出由官方 OTIO 读取并进行完整 JSON 往返比较。
- 第 8 步：149 项测试，覆盖多轨道、混合帧率、禁用项、全局起点标签和未知时长。
- 第 9 步：154 项测试，覆盖已知越界、未知范围、MissingReference 与非法活动媒体键。
- 第 10 步：161 项测试，覆盖拆分、裁剪、Gap 插入、失败原子性、容器独立性和顺移布局。
- 本地 JS / Wasm GC 检查、构建、测试通过；官方 OTIO 接受三种编辑后的真实导出，素材连续性与时长正确。
- CI 矩阵对 JS / Native / Wasm GC 执行官方往返及编辑输出验证。远程状态以对应提交的 Actions 记录为准。

# 第 11～13 步验证记录

- 第 11 步 CLI：Node 入口 `cmd/moontimeline.mjs` 使用真实临时文件测试，覆盖 inspect/validate/export/split/trim/gap、退出码 0/1/2、覆盖保护与 16 MB 输入上限；原生入口由 Linux CI 构建运行，Windows 本机缺 MSVC 未验证。
- 第 12 步演示：`demo/` 人工浏览器验证「载入示例 → 拆分（2 个片段变 3 个，总长仍 7 秒）→ 下载 → 官方 OTIO 读取 → 撤销」；界面截图见 `docs/assets/demo.png`。
- 第 13 步回归：120 个确定性拆分点、12 个由官方 OTIO 生成的双轨道工程、非法 UTF-8、循环元数据、输入大小限制；JS 与 Wasm GC 结果一致。
- 本地 2026-10-20 结果：`moon test --target js` 与 `--target wasm-gc` 各 **164 项通过**；`node --test tests/cli.test.mjs tests/regression.test.mjs` 6 项通过；`moon fmt --check`、`moon check --target js` 通过。

# 第 14 步发布验证记录

- 发布日：2026-10-21（Asia/Shanghai），版本 `0.1.0`，Mooncakes 包页 <https://mooncakes.io/docs/white-bear233/moontimeline>。
- `moon publish` 发布前自检链：`moon check` 通过 → 打包 `_build/publish/white-bear233-moontimeline-0.1.0.zip` → 解压到临时目录后再次 `moon check` 通过 → 上传返回 200。
- 独立安装验证：在 `%TEMP%` 下新建空模块 `verify/moontimeline_check`，执行 `moon add white-bear233/moontimeline`（解析到 0.1.0），运行 README 示例，输出 `48 frames @ 24fps = 2 s`、`At 30fps: 60 frames`，并用 `@otio.read` 读取 `Timeline.1` 样例、`@otio.write` 往返成功。
- 发布前重新查重：扫描本地 registry 索引的 3180 个模块，名称含 otio/timeline/video/clip/media 的条目中除本包外无 OTIO 或剪辑时间线库；相近方向的边界见 `compatibility.md`。
- 提交 `a51e97a` 的远程 CI：oracle、moonbit (js)、moonbit (native)、moonbit (wasm-gc) 四项全部通过。
- Windows 本机 Native 仍未运行（缺 MSVC C++ Build Tools），Linux Native 由 CI 覆盖；这一点不因发布而改变。

# 0.1.1 兼容与规模验证（2026-10-21）

针对「只认自己生成的样例」这一缺口，读取策略从「超范围即整体拒绝」改为「保留 + 分档」。

- 旧 schema：Clip.1（单数 `media_reference`）与 Sequence.1 读入后按当前语义处理，写回升级为 Clip.2 / Track.1。
- 未知字段与未知条目：进入 `extra` 原样保留；Transition.1 按零时长参与布局；其它未知条目保留但拒绝计算。
- 非有限字面量：`Inf` / `-Infinity` / `NaN`（Python json 默认输出）降级为 null 后继续读取，字符串内容不受影响。
- 上限：输入 16 M UTF-16 单元；写出校验节点预算 2,000,000。

本地结果（Windows x64，moon 0.1.20261016）：

| 项目 | 结果 |
|---|---|
| MoonBit 测试（JS / Wasm GC） | 170 项通过（新增 6 项兼容与降级用例） |
| 上游 sample_data 可读 | **13 / 13** |
| 上游 sample_data 可计算 | **9 / 13**（4 个为修剪或嵌套 Stack，原因明确） |
| 上游 sample_data 可写回 / 写回后布局一致 | **13 / 13** / **13 / 13** |

规模基准（`node tools/bench.mjs`，10 轨合成时间线，墙钟时间含文件 IO、扣除进程启动约 188 ms）：

| 片段数 | 输入大小 | inspect | validate | export |
|---|---|---|---|---|
| 1,000 | 0.5 MB | < 1 ms | 30 ms | 58 ms |
| 5,000 | 2.5 MB | 224 ms | 311 ms | 402 ms |
| 10,000 | 5.0 MB | 476 ms | 717 ms | 917 ms |
| 20,000 | 10.0 MB | 1,075 ms | 1,573 ms | 1,892 ms |

复现：`node tools/check_external_corpus.mjs`、`node tools/bench.mjs`。
