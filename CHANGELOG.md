# Changelog

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
