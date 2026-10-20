# 上游与兼容边界

参考项目：https://github.com/AcademySoftwareFoundation/OpenTimelineIO

- 固定版本：v0.18.1，Apache-2.0
- 固定 commit：44236713c1db295a6ffc66189ae98dbdfd0cb9c4
- Python 测试依赖：opentimelineio==0.18.1
- 本仓库样例由 tools/oracle.py 原创构造，通过官方 Python 包序列化。
- 没有复制上游源代码；数据模型和运算行为参考上游。Python 不进入产品运行时。

第 6 步读取器支持 RationalTime.1、TimeRange.1、Timeline.1、Stack.1、Track.1、Clip.2、Gap.1、
ExternalReference.1、MissingReference.1 的受限子集。第 7 步已实现对应子集导出，并用官方 OTIO 验证完整样例往返。
Transition、Effect、复杂嵌套及未知 schema 将显式拒绝编辑/导出。

fixtures/manifest.json 区分非法输入和合法但超出项目范围的 OTIO，不能将两者混淆。
gap_clip.otio 的轨道位置为 [2,7) 秒，素材范围为 [10,15) 秒，用于防止坐标混用。
全部媒体路径是占位符，不包含真实视频，也不需要下载媒体。

## 重复验证

```sh
python -m venv .venv
# Windows: .venv\Scripts\python；Linux/macOS: .venv/bin/python
python -m pip install -r tools/requirements.txt
python tools/oracle.py --check
```

上述 python 应来自激活后的虚拟环境。首次生成或主动更新基线才运行不带 --check 的命令。
--check 比较已提交基线，不会覆盖差异。时间向量包含固定边界与 96 组固定随机种子数据。
MoonBit reader 已运行正常样例和非法/不支持输入的拒绝测试；具体限制见 reader.md。
