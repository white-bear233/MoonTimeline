# 校验（0.1.3）

validate.validate 返回 code/severity/path/message；has_errors 判断 Error。不检查文件是否存在或 URL 是否可达。禁用对象仍检查结构和范围。

| 检查 | 行为 |
|---|---|
| 非法 offset、相邻转场、超过邻居时长、两端转场重叠、转场直接位于 Stack | Error，带对象路径 |
| 素材边界 | 按 time_scalar 映射后的连续素材范围检查；不能用未变速 source_range.end 代替 |
| 转场素材余量 | 前一转场 in_offset 是当前片段 head；后一转场 out_offset 是 tail；连同变速映射检查 available_range |
| 已知越界/余量不足 | source_out_of_bounds / insufficient_transition_handles，Error |
| 素材范围未知 | Info；转场余量无法判断时 unknown_transition_handles，Warning，不假设为零 |
| 嵌套组合转场递归素材余量 | 当前未验证，Warning，不保证媒体可交付 |
| 未知时间效果、多个时间效果、组合变速 | Error；数据可导出保留，但不允许按正常速度计算或编辑 |
| 缺媒体、空 URL、未知时长 | Warning；零时长对象为 Info |
| Marker 集合形状 | 检查数组/对象；完整 Marker schema 和编辑 API 尚待实现，保留不等于完整语义校验 |

素材边界以秒为单位，连续区间端点允许 1e-9 秒容差；起始样本不能落在 available_range 的排他结束边界，定格也不例外。

素材边界 Error 是本库严格质检策略。OTIO 本身允许记录缺素材或越界工程；export 可写出可读工程，编辑采用更严格规则。Warning/Info 不保证媒体可交付，调用者可提高严格程度。

公开可变模型的结构检查复用导出器，语义诊断继续收集。布局失败返回 layout_error，未知时长保持其诊断分类；编辑额外要求整个布局可确定。
