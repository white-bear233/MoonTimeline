# 前三步验证记录

验证日期：2026-10-20（Asia/Shanghai）。

环境：Windows x64；moon 0.1.20261016，moonc v0.10.16+b1a0e846e；
Python 3.11 + OpenTimelineIO 0.18.1。版本安装地址已确认可访问。

| 范围 | 结果 |
|---|---|
| 格式检查、公开 API 生成 | 通过 |
| JS 检查 / 构建 / 测试 | 109 项测试通过 |
| Wasm GC 检查 / 构建 / 测试 | 109 项测试通过 |
| 官方 OTIO 固定样例重新验证 | 5 份产物一致 |
| 自动生成对照测试与已提交文件比较 | 一致 |
| JS 可运行例子 | 48@24 → 2 秒 → 60@30；-1.5 → -2 |
| Windows Native | 缺 MSVC C++ Build Tools / Windows SDK，未通过本机运行验证 |
| GitHub Actions | 已配置 Linux JS / Native / Wasm GC + Python oracle，尚未远程执行 |

第 1、2 步尚无 MoonBit 行为实现，因此当时的 MoonBit 测试数是 0；
第 2 步实际运行官方 OTIO 生成与校验，第 3 步新增 102 个对照测试和 7 个边界行为测试。

不应将已配置 CI 描述成远程 CI 已通过。当前也尚未发布 Mooncakes，未完成完整比赛验收。
