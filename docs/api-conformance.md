# OTIO 0.18.1 逐 API 差分验证

对照版本固定为 `opentimelineio==0.18.1`，源码提交 `44236713c1db295a6ffc66189ae98dbdfd0cb9c4`。测试预期由官方库计算，不从 MoonTimeline 实现反推。运行库不依赖 Python。

本轮新增 **3,965 个官方差分测试**，其中 **1,308 个异常输入用例**（精确数量由用例清单的 `kind` 统计）；加上直接回归与既有测试，共 **4,455 项 MoonBit 测试**。另有 27 种 SerializableObject 的真实文件双向读写和 7 个宿主失败场景。

| 差分组 | 用例数 | 检查内容 |
|---|---:|---|
| fields | 1,043 | 所有默认对象的字段缺失、null、错误类型及读写结果 |
| nested | 223 | children/effects/markers/media 引用的元素类型及整数词法、64 位边界 |
| objects | 58 | schema 标识、克隆、独立修改、Metadata、可见性、默认对象查询与错误 |
| time / range / transform | 140 | 混合帧率、负值、无效时间、NaN/Inf、关系、clamp、变换 |
| codecs | 222 | 时间码、drop-frame、时间字符串及非法输入 |
| spatial | 90 | Color、V2d、Box2d，特殊数值、归一化、位深、颜色解析 |
| graph | 1,892 | Track/Stack 范围、裁切、零时长、负索引、坐标转换、时间/区间搜索 |
| image | 112 | 图像序列 URL、帧号、步长、边界与索引错误 |
| algorithms | 185 | 全部 7 个公开算法入口，混合帧率、转场、裁切、过滤和 Metadata/Marker 保留 |

## 本轮修复

- `almost_equal` 的容差改为以另一时间值的帧率衡量，与官方的非对称行为一致。
- 新增 `opentime` 原始值入口，保留无效时间、负区间和特殊浮点值。原有 `time/range/transform` 继续作为严格的编辑计算接口；通过 `RationalTime.checked()` 显式进入严格类型。
- 轨道范围、可见范围、范围列表、结构坐标转换及算法裁切保留原始帧率，不再统一转换为秒后重建。
- Stack 裁切、组合二分搜索、零时长片段、图像序列负索引按官方行为处理。
- 补齐嵌套字段类型检查、缺失 Marker.color 的 GREEN 默认值、可空字段与图像序列整数解码规则。
- 修正颜色前缀/部分十六进制解析、AGBR 解码顺序、可选位深以及向量极大/极小值归一化。
- 缺失 Clip 图像边界、未实现的抽象对象查询返回错误，避免把失败误作空结果。
- 官方结构算法允许转场展开生成负时长，序列化层予以保留；实际编辑仍由严格校验阻止无效工程。

## 覆盖口径与未完成项

[逐成员索引](api-conformance-coverage.json) 枚举 **722 个上游类成员/算法入口**：518 项关联本轮 MoonBit 差分用例，54 项关联宿主文件测试，其余 150 项明确标为尚未被本生成器覆盖。既有测试另行保留，不能用“已有模块”补充未验证的通过计数。[用例清单](api-conformance-cases.json) 给出每个用例的上游成员、输入类别和文件位置。

**这仍不是“上游全部 API 和全部异常行为已兼容”的结论。** 字段读写测试不等于 Python setter/引用身份/可变父指针测试；当前异常差分比较成功或 `Result::Err`，没有逐一认证 Python 异常类及错误消息。未覆盖成员中包括列表式修改与身份语义、部分深层对象查询、Python 插件加载/反射及 Manifest 查询。它们不能被默认为通过。

适配边界：MoonBit 图使用不可变值和路径，文件与插件模块通过宿主连接；不执行 Python 插件源码。越界 C++ 浮点转 Int32 涉及未定义行为，本库返回显式错误，不把特定机器上的强制转换结果当兼容要求。文件覆盖保护、归档路径及大小限制继续生效。

## 复现和防退化

```sh
python -m pip install -r tools/requirements.txt
python tools/generate_api_tests.py
moon fmt conformance
git diff --exit-code -- conformance docs/api-conformance-cases.json docs/api-conformance-coverage.json
moon test --target js
moon test --target wasm-gc
moon test --target native
node tools/build-js.mjs
python tools/check_api_files.py
python tools/check_review.py
python tools/check_bundles.py
```

CI 在三个后端运行生成后的测试，并重新调用官方库生成预期、格式化后检查版本差异。上游升级需要重新生成并审查变化，不能只更新版本号。
