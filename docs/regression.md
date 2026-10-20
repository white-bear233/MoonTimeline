# 回归与限制（第 13 步）

- 102 个固定 OTIO 时间向量 + 模块行为测试，在 JS / Native / Wasm GC 上运行。
- 120 个确定性拆分点验证时长和素材连续性。
- 12 个官方 OTIO 构造的混合帧率、双轨道、Unicode 媒体路径工程，真实文件 CLI 与官方 OTIO 对照；CI 比较 Native/JS 完整 JSON 一致性。
- 4 百万代码单元、64 层 JSON 深度、20 万导出节点、16 MB 文件限制；循环元数据被拒绝。
- 非法 UTF-8、重复键、未知版本、不支持效果、数值溢出和失败原子性均有验证。
- 浏览器以 textContent 展示文件内容，不插入工程中的 HTML；媒体 URL 不发起请求。

复现：构建 JS 后运行 `node --test tests/*.test.mjs`、`python tools/check_corpus.py`。
Native 对照附加 `--native <可执行文件路径>`。Windows 原生 C 工具链仍非本地测试前提。
