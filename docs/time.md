# 时间模块

包名：`white-bear233/moontimeline/time`。构造和转换均返回 Result，错误不会静默变成 0。

| API | 语义 |
|---|---|
| RationalTime::new(value, rate) | 有限 value、有限正 rate；允许负时间和小数帧 |
| value() / rate() | 只读访问，字段不能从包外构造或修改 |
| to_seconds() | value / rate，溢出报错 |
| rescaled_to(rate) | 按 OTIO 的 value × new_rate / old_rate 顺序转换，不取整 |
| rounded_frames(rate, mode) | 在指定帧率下显式取整，返回整数值的 Double |

舍入策略：Floor 向负无穷取整，Ceil 向正无穷取整，TowardZero 向零取整，
NearestAway 四舍五入且恰好半帧时远离零（1.5→2，-1.5→-2）。
舍入 API 是本项目明确设计的策略，不声称与 OTIO 的 to_frames 默认舍入等价。

错误：InvalidValue、InvalidRate、NumericOverflow、UnsafeInteger。
帧整数绝对值限制为 2^53-1，避免 JS/Native 精度差异。
浮点计算仍有 IEEE 754 误差和极小数下溢；这不是任意精度有理数库。
转换中间结果溢出也会报 NumericOverflow，即使代数重排可能得到有限值。

```sh
moon run examples/time --target js
```

预期：48 帧 @ 24 fps 等于 2 秒，在 30 fps 下为 60 帧；-1.5 按 NearestAway 得到 -2。

测试包含官方 OTIO 102 个时间向量、往返帧率转换、负数舍入、非法输入、溢出与边界。
对照数值误差阈值为 1e-12 × (1 + |expected|)，并不要求浮点按位相同。
时间区间与时间加减尚待后续模块开发，不属于当前已交付 API。
