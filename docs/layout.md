# 布局、转场与播放坐标（0.2.0）

`timeline.layout` 返回叶片段 items、转场 transitions、轨道时长和总时长。Track 顺序排布，Stack 同时排布；每层 source_range 起点分别计入坐标转换。global_start_time 是显示标签，不偏移局部布局。禁用对象仍占结构时间并携带 enabled。

## 转场

- `model.transition_of` 为保留的 Transition.1 提供经过验证的类型视图；offset 必须有限、非负、帧率为正。
- 剪切点为 C，完整范围为 `[C-in_offset, C+out_offset)`，自身时长为两者之和。内部转场不推进 Track 游标，不能说它“零时长”。
- `timeline.transition_range(track,index)` 给出未裁剪的 Track 坐标范围；Layout 中记录转换后的完整范围、可见范围、cut、左右邻居路径。窗口外部分不参与 transitions_at 查询。
- 首尾转场可以有隐式 Gap 邻居，路径为 None；按上游 Track.available_range，首部 in_offset、尾部 out_offset 计入可用时长，range_of_child 的游标仍从零起。这两套规则分别测试，不把所有子项平移。
- `transition_issues` 检查连续转场、邻居长度、同片段两端转场重叠；零时长 Gap 淡入淡出是允许的例外。转场必须位于 Track，Stack 没有顺序邻接语义。

## 变速

片段展示时长仍为 source_range.duration。播放映射：

`media_seconds = source_start_seconds + (timeline_seconds - placement_start_seconds) * time_scalar`

支持 LinearTimeWarp.1（正向、慢放、负数倒放、零速）或 FreezeFrame.1（0）。倒放以 source_range.start_time 为第一个素材位置；例如起点 10 秒、倍率 -1，播放 1.5 秒后访问 8.5 秒。定格始终访问起点；不将时长除以倍率。多个启用的线性时间效果以 source_start 为锚点依次相乘，禁用效果跳过；视觉 Effect.1 保留但不改坐标；未知效果拒绝求值。

Placement.source.start 是可见部分的素材起点，duration 是展示时长，不能把 source.end_seconds 当作变速后的素材末端。time_scalar 与 source_at 才表示播放映射。OTIO 的 transformed_time 是不计算效果的结构坐标变换，播放映射是本库明确约定的扩展，不假称二者相同。

Track/Stack 自身变速递归传播；经过各层裁剪窗口后累乘倍率，定格选择相应子项并固定采样。未知时长、未知时间曲线与数值溢出返回错误。

正向布局为 [start,end)，倒放穿过片段边界时可能为 (start,end]；使用 start_inclusive/end_inclusive 明确端点，items_at、transitions_at、source_at 按这些标志查询。定格转场的 cut_seconds=None，不能伪造唯一切点。转场和片段分别查询，不渲染混合像素。
