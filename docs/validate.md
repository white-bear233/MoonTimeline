# 校验（0.2.0）

validate.validate 返回 code/severity/path/message；has_errors 判断 Error。不检查文件是否存在或 URL 是否可达。禁用对象仍检查结构和范围。

| 检查 | 行为 |
|---|---|
| 非法 offset、相邻转场、超过邻居时长、两端转场重叠、转场直接位于 Stack | Error，带对象路径 |
| 素材边界 | 按 time_scalar 映射后的连续素材范围检查；不能用未变速 source_range.end 代替 |
| 转场素材余量 | 前一转场 in_offset 是当前片段 head；后一转场 out_offset 是 tail；连同变速映射检查 available_range |
| 已知越界/余量不足 | source_out_of_bounds / insufficient_transition_handles，Error |
| 素材范围未知 | Info；转场余量无法判断时 unknown_transition_handles，Warning，不假设为零 |
| 嵌套组合转场递归素材余量 | 遍历后代及边界片段，应用各层变速再检查；未知媒体范围给 Warning |
| 时间效果 | 已实现线性效果链与组合变速；未知启用的时间曲线给 Error，数据保留 |
| 缺媒体、空 URL、未知时长 | Warning；零时长对象为 Info |
| Marker | 旧入口检查集合形状；schema.Marker 提供类型化字段/范围校验与编辑接口 |

素材边界以秒为单位，连续区间端点允许 1e-9 秒容差；起始样本不能落在 available_range 的排他结束边界，定格也不例外。

素材边界 Error 是本库严格质检策略。OTIO 本身允许记录缺素材或越界工程；export 可写出可读工程，编辑采用更严格规则。Warning/Info 不保证媒体可交付，调用者可提高严格程度。

公开可变模型先经过导出器结构检查；结构非法或存在循环/深度超限时停止递归，返回诊断。结构通过后继续语义诊断。布局失败返回 layout_error，未知时长保持其诊断分类；编辑额外要求整个布局可确定。
