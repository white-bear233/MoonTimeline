# OTIO 0.18.1 逐 API 差分验证

参照固定为 `opentimelineio==0.18.1`、源码提交 `44236713c1db295a6ffc66189ae98dbdfd0cb9c4`。预期由官方库计算；运行库不依赖 Python。官方测试生成器和宿主服务的模拟实现仅用于验证。

本轮累计 **6,703 个生成用例**，加上既有测试和直接回归，共 **7,193 项 MoonBit 测试**。生成用例含 **2,712 个预期错误场景**、**107 个明确标注的宿主/值语义适配场景**、**22 个上游危险输入的防护场景**；防护场景不计作与上游成功输出一致。另有 **81 次真实文件互读和 7 个宿主失败场景**。精确分类以 [用例清单](api-conformance-cases.json) 为准。

| 分组 | 用例数 | 检查内容 |
|---|---:|---|
| fields / nested | 1,266 | 字段缺失、null、错误类型、嵌套类型、整数词法及 64 位边界 |
| objects / media_properties | 87 | 克隆、Metadata、可见性、活动媒体键、枚举及可空媒体 |
| time / range / transform / codecs | 362 | 混合帧率、负区间、NaN/Inf、关系、时间码和字符串 |
| spatial | 111 | Color/V2d/Box2d、部分十六进制解析、归一化和特殊数值 |
| graph / traversal / collections | 3,833 | Track/Stack/Composition、深层范围、搜索、父子路径、列表操作及错误 |
| image | 112 | 图像序列 URL、帧号、步长、负索引和边界 |
| algorithms | 185 | 全部 7 个算法入口、转场展开、裁切、过滤、字段保留 |
| plugins | 385 | Manifest、模块缓存/反射、功能查询、回调参数及执行顺序、失败重试 |
| functions | 362 | 模块级时间快捷函数、序列化、版本表、URL、插件上下文及注册回调 |

## 已修复的差异

- 时间容差按目标帧率计算；原始 `opentime` 类型保留无效时间、负区间和特殊浮点。严格编辑类型仍拒绝非法工程。
- 范围、handles、隐式转场 Gap、坐标转换和算法裁切保留原始帧率；修正 Stack 裁切与组合二分搜索。
- 补齐继承类型查询、find_children/find_clips、父子关系、深层范围、count/index、pop/insert/reverse 的路径适配。
- 补齐 Marker 默认颜色、嵌套字段校验、可空媒体引用、图像序列整数/负索引以及颜色、空间计算规则。
- 插件读写回调顺序与官方对齐；新增 `Plugin.read_document/write_document`，分别传递适配器、Hook、媒体链接器参数，验证深复制、原生文件方法和字符串回退。`Registry.read/write` 继续作为简单回调接口。
- 新增插件模块懒加载、失败重试、功能与反射查询、Manifest 首匹配/合并/上下文缓存，以及 `core_api` 和 `url_utils` 入口。URL 同时对照 POSIX/Windows 规则，修复旧式盘符 `|`、百分号解码和 UNC 路径。
- 时间线快捷构造保留官方默认的 `tracks` 名称。缺失图像范围、抽象对象查询、无效子关系等失败不再伪装成空结果。

## 逐入口证据和适配边界

[覆盖索引](api-conformance-coverage.json) 现列出 **777 个入口**：33 个标准类的公开成员、7 个算法，以及原清单遗漏的 55 个模块级函数。其中 **716 项关联生成测试，56 项关联真实文件测试**；没有未说明的空白入口。生成器在新增入口没有证据或明确边界时直接失败。

余下 **5 项仅属于 Python/C++ 绑定层**，标为 `binding_specific_not_ported`，不计作通过：

| 上游入口 | MoonBit 边界 |
|---|---|
| core.add_method | Python 运行时给类追加方法；MoonBit 使用静态方法 |
| core.serializable_field | Python 属性描述符与 setter；本库使用类型化接口或 get/with_field |
| core.deprecated_field | Python 废弃属性描述符；不模拟 Python 属性访问 |
| core.set_type_record | C++/Python 包装对象的类型身份记录；原生值不使用该包装 |
| core.install_external_keepalive_monitor | C++/Python 引用计数监视器；MoonBit 对象由宿主 GC 管理 |

**入口有测试证据不等于所有输入或 Python 行为完全兼容。** 字段 wire 测试不证明所有 setter 行为；异常用例比较成功/失败及失败后的回调、文件状态，未逐项保证 Python 异常类和消息逐字一致。列表身份通过 Graph 路径表达；可变共享父指针、Python 模块导入和类对象身份不直接移植。宿主提供模块、文件、环境变量与反射信息，SchemaDef 类对象用稳定标识表达。core_api 的类型/发布版本表是固定上游版本的基线；自定义 schema 注册在各 Registry 内隔离。

保留并单列上游 0.18.1 的异常规则：Composition 对已有父对象执行 reverse 会失败、过深的 trimmed_range_of_child 可能返回 NotAChildError、非空 version_manifests 的 plugin_info_map 会失败。无父对象的某些 range_of_child 调用会令上游进程崩溃，零帧率时间字符串/时间码涉及非有限值转整数；本库明确拒绝，不复制崩溃或未定义输出。

文件覆盖保护、归档路径和体积限制继续生效。序列化比较以完整 JSON 数据为准，不承诺空格缩进逐字相同。上游整套测试尚未逐例移植，不应据此宣传“100% OTIO 兼容”。

## 复现

```sh
python -m pip install -r tools/requirements.txt
python tools/audit_api.py --check
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

CI 在三个后端执行测试，并重新调用官方库生成预期、格式化后检查文件无漂移。上游版本变化需要重新生成并审查差异。
