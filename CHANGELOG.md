# Changelog

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
