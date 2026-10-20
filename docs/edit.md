# 编辑（第 10 步）

所有 API 返回 Result[Timeline, String]；索引从零开始，时间参数使用 RationalTime。
- split(t, track_index, item_index, offset)：offset 是片段内相对时间；拒绝起点和终点，拆分后总时长不变。
- trim(t, track_index, item_index, offset, duration)：保留指定子区间，采用 ripple 顺移模式，后续片段前移；拒绝越界和零长度。
- insert_gap(t, track_index, index, duration)：在 index 前插入正时长 Gap，index==length 表示追加。

适用于 Clip 与 Gap。源范围从 source_range 或活动媒体 available_range 得到；都未知则不能拆分或裁剪。
操作前后进行结构及素材范围校验，Error 阻止编辑，Warning/Info 不阻止。
每次编辑成功返回独立工程；JSON 元数据、媒体映射、数组以及拆分后的两个片段均不共享可变容器。
任何失败不改变原工程。全工程深复制以正确性优先，当前不适合高频实时拖动，后续可优化。
仍采用 Double 时间计算，不做隐式帧取整，不提供复杂变速、转场或嵌套编辑。

`moon run examples/edit --target js` 输出拆分、裁剪、插入 Gap 的三个工程。
`tools/check_edits.py` 使用官方 OTIO 读取真实 MoonBit 输出，检查素材连续性、时长、布局和完整 JSON 往返。
