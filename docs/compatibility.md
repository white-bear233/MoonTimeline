# 上游与兼容边界

参考项目：https://github.com/AcademySoftwareFoundation/OpenTimelineIO

- 固定版本：v0.18.1，Apache-2.0
- 固定 commit：44236713c1db295a6ffc66189ae98dbdfd0cb9c4
- Python 测试依赖：opentimelineio==0.18.1
- 本仓库样例由 tools/oracle.py 原创构造，通过官方 Python 包序列化。
- 没有复制上游源代码；数据模型和运算行为参考上游。Python 不进入产品运行时。

第 6 步读取器支持 RationalTime.1、TimeRange.1、Timeline.1、Stack.1、Track.1、Clip.2、Gap.1、
ExternalReference.1、MissingReference.1 的受限子集。第 7 步已实现对应子集导出，并用官方 OTIO 验证完整样例往返。

> 0.1.1 起，超出计算子集的节点不再导致整份文件读取失败：它们按原始 JSON 保留，读写在，计算要么按已知语义（转场为零时长）处理，要么显式拒绝。能力分档见下节。

fixtures/manifest.json 区分非法输入和合法但超出项目范围的 OTIO，不能将两者混淆。
gap_clip.otio 的轨道位置为 [2,7) 秒，素材范围为 [10,15) 秒，用于防止坐标混用。
全部媒体路径是占位符，不包含真实视频，也不需要下载媒体。

## 能力分档（解析 / 计算 / 编辑）

| 节点或能力 | 解析 | 计算 | 编辑 | 说明 |
|---|---|---|---|---|
| Timeline.1 / Stack.1 / Track.1 | 是 | 是 | 是 | 基础容器 |
| Sequence.1（历史 Track 名） | 是 | 是 | 是 | 读取时按 Track.1 语义处理，写回升级为 Track.1 |
| Clip.2 / Gap.1 | 是 | 是 | 是 | `media_references` + `active_media_reference_key` |
| Clip.1（历史格式，含单数 `media_reference`） | 是 | 是 | 是 | 读取时迁移到 `DEFAULT_MEDIA`，写回升级为 Clip.2 |
| RationalTime.1 / TimeRange.1 | 是 | 是 | 是 | 值域、速率、舍入全部校验 |
| ExternalReference.1 / MissingReference.1 | 是 | 是 | 是 | 缺失素材与未知时长显式区分 |
| Transition.1 | 保留原始 JSON | 按零时长跳过 | 否（随轨道保留） | 转场位于剪切点，不推进游标；游标前后关系不受影响 |
| Effect.1 / Marker.3 / 任意宿主扩展字段 | 保留原始 JSON | 忽略 | 不可单独编辑，随宿主写回 | 不再触发整体拒绝 |
| GeneratorReference.1 / Color.1 等其它媒体 | 保留原始 JSON | 未知时长（Info） | 否 | 素材边界不可判定，`validate` 降低为提示 |
| 轨道或 Stack 上的 `source_range`（修剪） | 保留 | 拒绝（`composition_trimmed`） | 否 | 修剪语义未实现，不静默按全长计算 |
| 嵌套 Stack、其它未知条目 | 保留原始 JSON | 拒绝（`unsupported_item`，Error） | 否 | 时长无法确定，宁可报错也不猜 |
| 非有限 JSON 字面量（`Inf` / `Infinity` / `NaN`） | 降级为 `null` 后读取 | 忽略 | — | Python `json` 默认会写出这些值；JSON 无法表示，字符串内不受影响 |
| 超过 16 M UTF-16 单元的输入 | 拒绝（`input_limit`） | — | — | 与 CLI 的 16 MB 字节上限对应 |

「解析」指能读入并原样写回；「计算」指参与布局、查询与校验；「编辑」指可以作为拆分/裁剪/插入的目标。

## 外部语料结果（0.1.1）

用上游自己的 [sample_data](https://github.com/AcademySoftwareFoundation/OpenTimelineIO/tree/v0.18.1/tests/sample_data) 做回归，`tools/check_external_corpus.mjs` 可复现：

| 指标 | 结果 |
|---|---|
| 可读 | 13 / 13 |
| 可计算（布局无错误） | 9 / 13 |
| 可写回 | 13 / 13 |
| 写回后布局与条目数一致 | 13 / 13 |

不可计算的 4 个文件都有明确原因：2 个带修剪（`composition_trimmed`），2 个含嵌套 Stack 等未知条目（`unsupported_item`）。这些文件仍然能读、能改其它部分、能完整写回。

## 生态中的相近库（发布前查重，2026-10-21）

扫描本地 Mooncakes registry 索引的 3180 个模块，没有已发布的 OTIO 实现或剪辑时间线库。名称与媒体/时间线相关的条目及其边界：

| 模块 | 实际职责 | 与本项目的关系 |
|---|---|---|
| `NoahLiu/yue-media` | FFmpeg 绑定：解码、转码、封装 | 处理像素与码流，不涉及时间线数据模型 |
| `Kai-Junhan/moonbit-motion-lab` | 运动曲线质检与确定性取值时间线 | 面向渲染插值，不是剪辑工程交换格式 |
| `BigSaltyMan/moonclip` | 多边形布尔、偏移、描边 | 图形学裁剪，与「片段剪辑」无关 |
| `white-bear233/moontimeline` | 本项目 | OTIO 子集读写、布局、诊断、编辑 |

该结论只覆盖公开索引中的已发布模块，不含私有仓库；不构成官方选题认定。

## 重复验证

```sh
python -m venv .venv
# Windows: .venv\Scripts\python；Linux/macOS: .venv/bin/python
python -m pip install -r tools/requirements.txt
python tools/oracle.py --check
```

上述 python 应来自激活后的虚拟环境。首次生成或主动更新基线才运行不带 --check 的命令。
--check 比较已提交基线，不会覆盖差异。时间向量包含固定边界与 96 组固定随机种子数据。
MoonBit reader 覆盖正常样例、非法输入拒绝与超范围节点保留三类测试；具体限制见 reader.md。
