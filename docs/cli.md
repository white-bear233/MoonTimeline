# 命令行（第 11 步）

Windows 快速运行：先 `node tools/build-js.mjs`，再 `node cmd/moontimeline.mjs inspect fixtures/valid/gap_clip.otio`。
Linux 原生：`moon build --target native`，使用 `_build/native/debug/build/cmd/native/native.exe`（Linux 上亦可能带 .exe 后缀）。
原生 CLI 的极小 C 适配层仅负责文件 IO；参数解析、计算、编辑均使用 MoonBit。
Windows 原生仍需要 MSVC，Unicode 路径请优先使用 Node 入口。

命令 inspect、validate 输出 JSON；export、split、trim、gap 必须提供 --output。
编辑需 --track、--clip、--rate；split/trim 需 --at-frame；trim/gap 需 --duration-frames。
索引从零开始，--clip 对应轨道中包括 Gap 在内的 item index。显式指定帧率，避免误用。
输出文件必须不存在，禁止覆盖原文件。输入上限 16 MB，库内另有字符数/深度限制。
退出码：0 成功（包括警告），1 校验发现确定错误，2 参数、读取、解析、编辑或写入失败。

例：`node cmd/moontimeline.mjs split fixtures/valid/gap_clip.otio --track 0 --clip 1 --at-frame 48 --rate 24 --output split.otio`。
`node --test tests/cli.test.mjs` 使用真实临时文件验证退出码、编辑输出和覆盖保护；CI 同时测试 Linux Native。
