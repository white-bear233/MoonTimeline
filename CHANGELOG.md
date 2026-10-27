# Changelog

## 0.2.0 — API 差分增量（未发布）

- 新增 3,965 个 OTIO 0.18.1 差分用例，涵盖数值、对象字段、嵌套类型、轨道查询、媒体、空间及全部 7 个算法入口。
- 新增 `opentime` 原始值兼容入口；修复混合帧率范围、结构坐标、裁切、Stack 搜索、颜色及整数词法差异。
- 补齐 27 类文件互读与 7 个宿主错误场景，生成用例及逐成员覆盖索引，并接入三后端 CI。
- 覆盖索引明确保留未验证项，详见 `docs/api-conformance.md`；本次不声明完整 OTIO 兼容。

## 0.1.3 — 仓库修订，尚未发布

- 转场完整/可见范围、类型视图、时间点查询；相邻片段、重叠与素材余量检查。
- 单片段快放、慢放、倒放和定格映射；拆分/裁剪同步素材起点与边界检查。
- 修正多层非零窗口的素材坐标；未知效果、组合变速拒绝计算，避免假按正常速度。
- Marker、Metadata、Effects、扩展字段保留及独立副本测试；插入 Gap 不得悄悄改接转场。
- 特殊数值不再替换成 null，当前明确拒绝；读取兼容缺口如实登记。
- 193 项 MoonBit 测试；8 个官方结构预期、21 个真实编辑导出与全 JSON 保留验证；CI 覆盖三后端。
- 完整 OTIO schema/API/算法/适配器/插件路线图、整改对照和修订申报书。

以下为历史记录；0.1.1/0.1.2 的“零时长转场”“特殊值降级”及 13/13 指标不再代表当前策略或完整兼容性。

## 0.1.2 — 2026-10-22

补齐轨道/Stack 裁剪与嵌套组合语义，上游样例可计算率从 9/13 提升到 13/13。

- **组合裁剪**：`source_range` 作为视窗参与布局，子项按交集裁切并平移素材坐标；根 Stack 的窗口同样生效。
- **嵌套组合**：`Stack`/`Track` 可作为轨道子项递归解析与布局，内部坐标映射到父级；Stack 子项允许轨道、嵌套组合与散片。
- **路径寻址**：布局结果带 `/tracks/children/...` 路径；新增 `split_at` / `trim_at` / `insert_gap_at`，CLI 增加 `--path`。
- **安全编辑**：组合 trim 只改写 `source_range`；组合 split 切成两段窗口；根轨道拒绝拆分（`cannot_split_root`）；失败不修改原工程。
- **测试**：175 项 MoonBit 测试；新增嵌套内拆分、嵌套组合裁剪、根轨道裁剪、嵌套插入 Gap 与根轨道拆分拒绝。

## 0.1.1 — 2026-10-21

兼容性与规模补强，读取不再因为超出计算子集而整体失败。

- **保留而非拒绝**：未知字段、`effects`、`markers` 以及不认识的条目按原始 JSON 保存，读写往返不丢数据。
- **旧 schema 兼容**：`Clip.1`（单数 `media_reference`）与 `Sequence.1` 读入后升级为 `Clip.2` / `Track.1` 写出。
- **转场语义**：`Transition.1` 按零时长参与布局，不推进轨道游标；其它未知条目保留但计算时显式报 `unsupported_item`。
- **修剪**：轨道或 Stack 的 `source_range` 保留，布局显式拒绝（`composition_trimmed`），不静默按全长计算。
- **非有限数值**：`Inf` / `Infinity` / `NaN` 字面量降级为 `null` 后读取（Python `json` 默认输出这类值）。
- **空值容忍**：`name: null` 与 `metadata: null` 按空值处理，并原样写回。
- **规模**：输入上限提升到 16 M UTF-16 单元，写出节点预算提升到 2,000,000；新增 `tools/bench.mjs` 与 `tools/check_external_corpus.mjs`。
- 上游 `tests/sample_data`：可读 13/13，可计算 9/13，可写回 13/13。
- 测试从 164 项增加到 170 项。

## 0.1.0 — 2026-10-21

首个公开版本。

- OTIO 子集读写：RationalTime、TimeRange、Timeline、Stack、Track、Clip、Gap、ExternalReference、MissingReference。
- 区间运算、布局查询、结构化诊断，以及拆分 / 顺移裁剪 / 插入 Gap 的原子编辑。
- 命令行（Node 与 Linux 原生入口）与浏览器演示。
- CI 覆盖 JS / Native / Wasm GC 与官方 OTIO 对照。
