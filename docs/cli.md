# 0.2.0 新增对象、算法与媒体包命令

先执行 `moon update` 和 `node tools/build-js.mjs`。

```sh
node cmd/moontimeline.mjs schemas
node cmd/moontimeline.mjs convert input.otio --output normalized.otio
node cmd/moontimeline.mjs pack input.otio --output delivery.otioz
node cmd/moontimeline.mjs pack input.otio --output delivery.otiod --policy missing
node cmd/moontimeline.mjs unpack delivery.otioz --output unpacked
node cmd/moontimeline.mjs flatten input.otio --output flattened.otio
node cmd/moontimeline.mjs filter input.otio --prune Transition --output filtered.otio
node cmd/moontimeline.mjs find input.otio --schema Clip
node cmd/moontimeline.mjs trim-range input.otio --start 2 --duration 5 --output trimmed.otio
node cmd/moontimeline.mjs expand-transitions track.otio --output expanded.json
```

时间参数为秒；展开转场的输入为 Track 根。转换支持任意标准对象、集合和普通 JSON 根；filter 的 prune 以 schema 名称指定，逗号分隔。pack/convert 可按 `.otioz` 或 `.otiod` 输出包。策略 `error`（默认）、`missing`、`all-missing` 分别要求本地媒体、缺失时转 MissingReference、全部转 MissingReference。

目标文件/目录必须不存在。解包在创建目录前先验证所有路径，不创建链接、不联网下载媒体。带媒体的 OTIOZ 导出裸 JSON 会被拒绝，请 unpack 保留媒体及相对路径。核心归档总量默认 256 MiB；Node 桥接的 JSON 信封还受 16 MB 文本限制，适用于小型交换包，大媒体宿主应直接使用 `adapters` 的字节 API。

这些新增文件命令属于 Node 宿主；Native CLI 当前保留下面的旧命令集。新增归档/算法核心本身支持三个后端，不能把此处 Node 文件命令误写为已接入 Native CLI。

---

# 命令行（第 11 步）

Windows 快速运行：先 `node tools/build-js.mjs`，再 `node cmd/moontimeline.mjs inspect fixtures/valid/gap_clip.otio`。
Linux 原生：`moon build --target native`，使用 `_build/native/debug/build/cmd/native/native.exe`（Linux 上亦可能带 .exe 后缀）。
原生 CLI 的极小 C 适配层仅负责文件 IO；参数解析、计算、编辑均使用 MoonBit。
Windows 原生仍需要 MSVC，Unicode 路径请优先使用 Node 入口。

命令 inspect、validate 输出 JSON；export、split、trim、gap 必须提供 --output。
编辑可用 --track、--clip 指定顶层位置，或用 --path 直接寻址任意层级：`--path /tracks/children/0/children/2/children/1`。
使用 --path 时不再要求 --track/--clip；gap 的插入位置仍由 --clip 给出。编辑需 --rate；split/trim 需 --at-frame；trim/gap 需 --duration-frames。
索引从零开始，--clip 对应轨道中包括 Gap 在内的 item index。显式指定帧率，避免误用。
对 Track/Stack 或嵌套组合执行 trim 时，窗口写入 `source_range`，内部内容不被改写；split 组合目标会切成两个窗口（根轨道不可拆分，返回 `cannot_split_root`）。
输出文件必须不存在，禁止覆盖原文件。输入上限 16 MB，库内另有字符数/深度限制。
退出码：0 成功（包括警告），1 校验发现确定错误，2 参数、读取、解析、编辑或写入失败。

例：`node cmd/moontimeline.mjs split fixtures/valid/gap_clip.otio --track 0 --clip 1 --at-frame 48 --rate 24 --output split.otio`。
按路径裁剪嵌套轨道：`node cmd/moontimeline.mjs trim project.otio --path /tracks/children/0/children/1/children/0 --at-frame 24 --duration-frames 48 --rate 24 --output trimmed.otio`。
`node --test tests/cli.test.mjs` 使用真实临时文件验证退出码、编辑输出和覆盖保护；CI 同时测试 Linux Native。
