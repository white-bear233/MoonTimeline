# 时间区间（第 4 步）

`range.TimeRange` 采用半开区间 [start, end)，结束点不包含在内。
允许负起点和零长度，拒绝负时长、溢出和小到无法表达结束点的正时长。
`contains` 接受任意有效帧率；`intersection` 与 `trimmed_to` 以绝对时间求交，
输出采用左侧区间起点的帧率，不修改输入。无交集、仅边界相接、空区间返回 None。
错误使用 Result 的字符串错误码；不做隐式帧取整。
当前使用 IEEE 754 秒数比较，边界不引入容差；不是任意精度实现。

Windows 可运行 `tools/verify.ps1` 统一验证现有模块。
