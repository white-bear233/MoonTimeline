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
