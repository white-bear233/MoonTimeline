# OTIO 兼容状态（0.2.0 仓库版本）

完整模块、入口、测试证据与 MoonBit API 差异见 [模块索引](otio-modules.md)。参考固定为 OTIO v0.18.1；全部核心层已有实现，但尚未完成上游整套测试逐例迁移与逐成员兼容认证。

- 任意标准根对象、对象集合及 33 种 schema/值类型由 `schema` 提供。原有 `otio.read` 仍以 Timeline 为根，保持原有编辑 API 的严格约束。
- 转场的自身时长不推进内部轨道游标；完整/可见范围、相邻片段限制、直接编辑和嵌套媒体余量校验均已实现。
- 片段与组合线性变速、倒放、定格传播至素材坐标；启用的仿射效果倍率相乘。未知时间曲线拒绝求值。结构坐标查询保持上游忽略 TimeEffect 的规则。
- Marker 有类型化编辑、范围筛选及宿主/父坐标查询。Metadata、Effects、扩展字段独立复制；原工程不随编辑结果变动。
- 图像序列、生成器、媒体选择、颜色和图像边界已有可调用接口，不再只依赖原始 JSON 保留。
- OTIO JSON 保留 Inf/NaN 和精确数值词法；`opentime` 原始计算类型保留无效时间与负区间，原有编辑计算类型仍要求有效有限时间。版本降级必须显式请求；Clip.2 降为 Clip.1 仅保留活动引用，与上游一致。
- 三种内置格式和插件注册/Manifest/发现回调已实现。归档核心不自动访问磁盘；宿主提供文件内容及模块解析回调。

13 个官方样例均可读取、返回布局、写回并稳定往返。该指标证明样例路径能运行，不能替代语义测试。另有官方时间/算法差分、21 个实际编辑导出、媒体包双向互读和回归验证。

本轮新增差分用例、已修复差异及未完成的成员见 [逐 API 报告](api-conformance.md)。

## 生态中的相近库（发布前查重，2026-10-21）

扫描本地 Mooncakes registry 索引的 3180 个模块，没有已发布的 OTIO 实现或剪辑时间线库。名称与媒体/时间线相关的条目及其边界：

| 模块 | 实际职责 | 与本项目的关系 |
|---|---|---|
| `NoahLiu/yue-media` | FFmpeg 绑定：解码、转码、封装 | 处理像素与码流，不涉及时间线数据模型 |
| `Kai-Junhan/moonbit-motion-lab` | 运动曲线质检与确定性取值时间线 | 面向渲染插值，不是剪辑工程交换格式 |
| `BigSaltyMan/moonclip` | 多边形布尔、偏移、描边 | 图形学裁剪，与「片段剪辑」无关 |
| `white-bear233/moontimeline` | 本项目 | OTIO 读写、布局、诊断、编辑（完整实现推进中） |

该结论只覆盖公开索引中的已发布模块，不含私有仓库；不构成官方选题认定。

## 复现

```sh
python -m pip install -r tools/requirements.txt
moon update
moon test --target js
moon test --target wasm-gc
node tools/build-js.mjs
python tools/check_review.py
python tools/check_bundles.py
python tools/audit_api.py --check
node tools/check_external_corpus.mjs
```

Native 核心与原有文件 CLI 在 Linux CI 中运行。0.2.0 尚未上传 Mooncakes，`moon add` 的已发布版本不包含本轮全部增量。
