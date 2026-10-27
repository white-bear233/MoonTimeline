# 0.2.0 公开 API 兼容性增量（2026-10-28）

固定 OTIO 0.18.1、MoonBit 0.10.16+b1a0e846e。运行时不依赖 Python OTIO；Python 用于生成参考结果。

| 验证 | 结果 |
|---|---|
| 本地 JS / Wasm GC | 各 7,193 项测试通过，含 6,703 项生成用例 |
| 本地 Native | 静态检查通过；本机无 MSVC，运行测试由 Linux CI 执行 |
| 格式 / 公开签名 / 生成可复现性 | fmt/info 通过；重新生成并格式化后，测试与两份证据索引逐字节一致 |
| 逐入口证据 | 777 项：716 项关联生成用例，56 项关联真实文件测试；5 项 Python 绑定专用接口明确不移植 |
| 异常与适配 | 2,712 项预期错误、107 项适配场景、22 项上游危险输入防护；不声称异常类和消息全部一致 |
| 真实文件 API | 27 类对象 × class/core/adapter 三条路径，共 81 次双向互读；7 项宿主失败检查 |
| 编辑 / 包装格式 / 原有回归 | 21 个编辑导出、OTIOZ/OTIOD 双向互读、8 项 CLI/回归通过 |
| 官方基线 / 原始语料 | 时间与结构基线、12 个 CLI 工程对照及 13 个上游样例通过 |

前一批提交 `15bba2a` 的 [CI](https://github.com/white-bear233/MoonTimeline/actions/runs/40524534060) 已通过 oracle、JS、Native、Wasm GC（当时 4,455 项测试）。本轮增量的远程执行状态以 [Actions 中对应提交](https://github.com/white-bear233/MoonTimeline/actions) 为准。

入口映射、可复现命令和语言适配边界见 [逐 API 报告](api-conformance.md)。772 项有证据不等于所有输入已穷举；未逐例移植上游整套测试，不标称“100% OTIO 兼容”。0.2.0 尚未上传 Mooncakes。

---

以下记录保留当时的测试数量与范围。

# 0.2.0 模块验收（2026-10-27）

工具链 MoonBit 0.10.16+b1a0e846e，官方参照 opentimelineio==0.18.1。运行时依赖新增纯 MoonBit `moonbit-community/flate@0.9.0`。

| 验证 | 结果 |
|---|---|
| 本地 JS / Wasm GC | 各 489 项 MoonBit 测试通过；fmt/info/check/build 通过 |
| 本地 Native | 静态检查通过；Windows 无 MSVC，运行测试由 Linux CI 执行 |
| 官方生成基线 | 33 种默认对象、21 组必需字段、140 个时间差分、73 个算法/图/图像序列差分；CI 检查生成结果无漂移 |
| 实际编辑导出 | 21 例官方读取、写回、完整 JSON 保留通过 |
| OTIOZ / OTIOD | 官方和 MoonBit 双向读写、媒体字节一致、中文/空格/Windows 路径、危险归档拒绝通过 |
| 原有 CLI / 回归 | 8 项通过，包括 120 个确定性拆分位置；12 个 CLI 工程对照通过 |
| 上游原始语料 | 13/13 可读、布局返回、可写回、报告稳定；不等同全部语义兼容 |
| API 盘点 | 固定版本 33 个类及 7 个公开算法；清单可复现，不作为测试通过率 |

实现提交 `2ce89a4` 的 [CI](https://github.com/white-bear233/MoonTimeline/actions/runs/40513258737) 已通过 oracle、JS、Native、Wasm GC 四项（当时核心测试 487 项）。最终仓库新增两项回归并修正负数半帧舍入，最新执行记录以 [Actions](https://github.com/white-bear233/MoonTimeline/actions) 对应提交为准。

模块实现与公开 API 适配见 [otio-modules.md](otio-modules.md)。还未逐例移植上游整套测试，不能将定向验证写成“全部上游测试通过”。0.2.0 尚未上传 Mooncakes。

---

以下为历史验收记录，测试数量与兼容范围按当时版本解释。

# 0.1.3 初审整改验证（2026-10-27）

基线 1d3e324 / 0.1.2。测试工具链 MoonBit 0.10.16+b1a0e846e、Python 3.11、opentimelineio==0.18.1。

| 本地验证 | 结果 |
|---|---|
| moon fmt / info / check / build | JS、Wasm GC 通过；Native 静态检查通过 |
| MoonBit 单元与差分测试 | JS、Wasm GC 各 193 项通过 |
| 新增官方结构预期 | 8 个 case，涵盖内部/边界转场、零 Gap、裁剪及多层非零窗口 |
| 播放映射与安全编辑 | 快/慢/倒放/定格、素材和转场余量、相邻约束、拒绝后的原子性、字段及可变容器独立性 |
| tools/check_review.py | 21 个实际编辑导出：官方读写与完整 JSON 预期一致 |
| 原有 oracle / 时间生成器 / roundtrip / edits | 通过 |
| CLI / JS 回归（node --test） | 8 项通过 |
| 12 个确定性 CLI 工程（tools/check_corpus.py） | JS 与官方 OTIO 通过 |
| 上游样例语料 | 可读/可写回/报告稳定 12/13，布局返回 11/13；两个已知边界精确检查，见兼容表 |

Windows 本机缺 MSVC，未执行 Native 构建/运行。Linux CI 配置三后端测试、生成预期一致性检查、真实 CLI、42 个 JS/Native 编辑导出和 JSON 结果一致性；远程最终结果以本轮提交的 Actions 记录为准。

本轮不以旧版“样例布局无报错”作为正确性证据，不将拒绝支持的部分标称为完整实现。版本仅提交仓库，尚未发布 Mooncakes。

---

以下为历史记录，不代表当前兼容范围；特殊数值降级与零时长转场处理已被本轮纠正。

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

# 0.1.2 裁剪与嵌套（2026-10-22）

针对初审意见「OTIO 子集未覆盖轨道裁剪、嵌套组合」，补齐了这两类语义的计算与编辑。

- 组合窗口：Track/Stack 的 `source_range` 作为视窗，子项按交集裁切并同步平移素材坐标；根 Stack 的窗口同样生效。
- 嵌套组合：`Stack`/`Track` 作为轨道子项递归解析与布局，内部坐标映射到父级；`Stack` 子项可以是轨道、嵌套组合或散片。
- 路径寻址：布局结果带 `/tracks/children/0/children/2/...` 路径；编辑新增 `split_at` / `trim_at` / `insert_gap_at`，CLI 增加 `--path`。
- 安全编辑：对组合目标的 trim 只改写 `source_range`，不重写内部；组合 split 切成两段窗口；根轨道不可拆分（`cannot_split_root`）；失败不修改原工程。

本地结果（Windows x64，moon 0.1.20261016）：

| 项目 | 结果 |
|---|---|
| MoonBit 测试（JS / Wasm GC） | 175 项通过（新增 5 项嵌套/裁剪编辑用例） |
| 上游 sample_data 可读 / 可计算 / 可写回 / 写回稳定 | **13 / 13** / **13 / 13** / **13 / 13** / **13 / 13** |
| 0.1.1 时不可计算的 4 个文件 | 全部可计算（`multiple_track`、`screening_example`、`nested_example`、`premiere_example`） |

规模基准（`node tools/bench.mjs`，扣除进程启动约 197 ms）：

| 片段数 | 输入大小 | inspect | validate | export |
|---|---|---|---|---|
| 1,000 | 0.5 MB | 129 ms | 125 ms | 181 ms |
| 5,000 | 2.5 MB | 506 ms | 578 ms | 746 ms |
| 10,000 | 5.0 MB | 797 ms | 1,210 ms | 1,723 ms |
| 20,000 | 10.0 MB | 1,807 ms | 2,724 ms | 3,459 ms |
