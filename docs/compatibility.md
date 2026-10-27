# OTIO 兼容状态（0.1.3 仓库修订）

参考 [OpenTimelineIO v0.18.1](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/tree/v0.18.1)，固定提交 44236713c1db295a6ffc66189ae98dbdfd0cb9c4，Apache-2.0。代码独立用 MoonBit 重写，未复制上游源码；Python 仅用于测试，不进入产品运行时。

完整实现是正式项目目标，当前尚未完成。范围与分阶段验收见 [OTIO 完整实现路线图](otio-roadmap.md)。以下区分保留、计算、编辑；原样保留不能计作完整实现。

| 能力 | 保留/读写 | 计算 | 编辑 |
|---|---|---|---|
| Timeline.1 / Stack.1 / Track.1 | 支持 | 多轨、窗口与嵌套 | 按路径修改窗口，根轨道不能 split |
| Clip.2 / Gap.1 | 支持 | 时长、布局、素材坐标 | split / trim / insert_gap |
| Clip.1 / Sequence.1 | 读入升级 | 按当前结构 | 写回 Clip.2 / Track.1 |
| RationalTime.1 / TimeRange.1 | 支持 | 基础运算、转换、半开区间 | 通过模型 API |
| ExternalReference.1 / MissingReference.1 | 支持 | 活动媒体边界 | 随宿主复制保留 |
| Transition.1 | 原始 JSON + 类型视图 | 完整/可见范围、半开查询、相邻约束、片段素材余量 | 随轨道保留，不作为 split/trim 目标 |
| LinearTimeWarp.1 / FreezeFrame.1 | 原始 JSON + 倍率读取 | 单片段播放映射、素材边界；不改变展示时长 | split/trim 同步修正素材起点 |
| Track/Stack 时间效果、多个或未知时间效果 | 保留 | 明确拒绝 | 拒绝，避免错误映射 |
| Marker.2 / 历史或未知 Marker 字段 | 完整保留 | 仅集合形状检查，无可见性查询 | 不移位、不删范围外标记，拆分独立复制；无独立编辑接口 |
| Metadata / Effect.1 / Color / 宿主扩展 | 标准 JSON 完整保留 | 视觉效果不改变时间 | 深复制保留，不渲染效果 |
| GeneratorReference / ImageSequenceReference | 原始 JSON 保留 | 有已知范围可判时长；特定类型 API 未实现 | 随宿主保留 |
| 未知条目 | 原始 JSON 保留 | unsupported_item | 拒绝 |
| Inf / Infinity / NaN 等特殊数值 | 当前拒绝，invalid_json | 不计算 | 不编辑，不再改成 null |
| 任意根对象、SerializableCollection、OTIOZ/OTIOD、插件机制 | 待实现 | 待实现 | 待实现 |

公开读取器当前以 Timeline 为根，Track.kind 限 Video/Audio；Gap 必须给出 source_range；输入大小/深度限制见 [读取文档](reader.md)。这些是当前限制，也列入完整实现验收，不能据此声称覆盖全部合法 OTIO。

## 上游样例的实际意义

本轮 tools/check_external_corpus.mjs 对固定版本 13 个原始样例的结果：可读 12/13，布局返回 11/13，可写回 12/13，完整检查报告写回稳定 12/13。

- big_int.otio 含 OTIO 允许的特殊数值，明确拒绝；这是兼容缺口，不能称上游文件非法。
- nested_example.otio 含组合变速，读写保留，计算/编辑明确拒绝。
- 旧版 13/13 的指标只检查布局无报错，既忽略变速，也会改写特殊值；不是语义正确率。
- 新增的 8 个结构差分测试比较官方真实范围、时长、嵌套窗口与素材起点；播放映射使用独立契约测试，因为上游结构 API 不求值时间效果。
- tools/check_review.py 对 21 个真实编辑导出检查官方往返与所有 JSON 字段；自有扩展字段另外由 MoonBit 回归测试验证。

## 待补的语义

组合变速和嵌套组合转场的递归余量校验、Marker 类型化 API/可见性、完整 schema/API/算法与适配器均在路线图。未知媒体可用范围不视作越界，也不能视为已验证可交付。已知越界按本库质检策略报 Error，上游 OTIO 自身允许保存这类工程。

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

安装 tools/requirements.txt 中固定的 opentimelineio==0.18.1 后：

```sh
python tools/oracle.py --check
python tools/generate_semantic_tests.py
moon fmt conformance
moon test --target js
moon test --target wasm-gc
node tools/build-js.mjs
python tools/check_review.py
node tools/check_external_corpus.mjs
```

CI 对生成的结构预期执行 git diff 检查，防止基线随实现悄悄改动。
