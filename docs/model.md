# 时间线模型（第 5 步）

Timeline 的根 Stack 包含同时发生的音视频 Track；Track 的 Clip/Gap 顺序排列。
模型仅存 source_range，不把轨道位置写入片段，布局将由第 8 步计算。
Clip 保留所有媒体引用及 active key；支持 External 和 Missing 两种引用。
source_range 缺失时可回退 available_range；均缺失返回 unknown_source_range，不能假设零时长。
元数据保持 Json，保留名称、启用状态、颜色、global_start_time、媒体可用范围及图像边界。
媒体 URL 仅作为字符串保存，不读取文件、不下载资源。

这些是公开数据结构，Array/Map/Json 容器可变，调用者负责所有权；当前不承诺深度不可变。
后续编辑 API 必须生成独立副本并验证输入，避免修改原工程。
