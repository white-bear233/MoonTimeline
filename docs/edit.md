# 编辑与字段保留（0.2.0）

所有操作返回 Result[Timeline,String]；索引从零开始，时间参数为 RationalTime，按展示时间解释。

- split / split_at：拆分片段或嵌套组合窗口。展示时长守恒；变速片段右段素材起点增加 offset × scalar，定格不变，倒放向前移动。根轨道不能拆分成并列轨道。
- trim / trim_at：按 offset、duration 保留子窗口，随后片段顺移。变速只改变素材起点增量，duration 仍是展示时长。
- insert_gap / insert_gap_at：在 Track 索引前插入正时长 Gap。插入点若直接接触转场则拒绝，避免悄悄把转场改接到 Gap。

编辑前后校验结构、布局、效果及素材边界。已知错误阻止编辑；范围未知给出诊断，无法计算布局则不能编辑。操作若导致转场超过邻居或两端转场重叠，整个操作失败。转场不能作为 split/trim 目标；原始 JSON 随轨道保留；直接转场编辑使用 set_transition_offsets、insert_transition、remove_transition，成功后重新校验邻居与素材余量。

## Marker、Metadata 与扩展数据

遵循 OTIO：Marker.marked_range 使用所属 Item 的坐标系，与宿主 source_range/trimmed_range 同一坐标系，不是展示时间从零开始的坐标。

- 裁剪只改 source_range，不平移、截短或删除标记。窗口外标记仍保留，便于恢复剪辑及外部工具使用。
- 拆分后的两段各保留完整、独立标记列表，跨切点和范围外标记都不丢失。坐标、颜色、名称、metadata、未知字段不变。这里不提供“只保留可见标记”模式，不能把完整列表当作可见列表。
- 片段变速后，标记仍在原宿主坐标中，不按倍率修改标记本身。schema.Object.markers_in_range 提供宿主坐标筛选；graph.markers_in_coordinates 可映射到父级或其他对象的结构坐标，不把结构变换当作效果求值。
- 插入 Gap 或顺移裁剪时，轨道/Stack 标记不随片段自动吸附，仍保留宿主坐标。未来吸附或删除范围外标记应使用显式选项。
- Timeline、Stack、Track、Clip、媒体引用的 Metadata、Effects、Color、扩展字段均保留；新 Gap 不继承其他片段元数据。

成功返回深复制工程；两段及原工程不共享可变 JSON、数组、媒体引用映射。失败不改输入。当前深复制优先保证原子性，不承诺高频拖动性能。

conformance/review_test.mbt 检查字段和容器独立性；tools/check_review.py 检查 21 种实际编辑导出，逐字段对比原工程与预期变化，并经官方 OTIO 0.18.1 完整往返。Linux CI 还比较 JS/Native 输出。

新对象 API 的 Marker/Metadata/Effect/媒体引用修改返回独立 Object，可用 Graph.replace 接回工程；标准算法在 algorithms 包中，和本页顺移编辑 API 分开。
