# OTIO 导出（第 7 步）

`otio.write` 返回 Result[String, Diagnostic]；按读取器相同的受限 schema 导出。
保留所有已建模字段、元数据、所有媒体引用及当前选择。输出不保证原始键顺序或空白。
序列化前检查非有限数字、JSON 深度和节点数，序列化后按读取规则验证公开可变模型。
`otio.clone` 通过序列化和读取获得独立容器，供编辑操作使用。
`tools/check_roundtrip.py` 实际运行 MoonBit 导出，官方 OTIO 读取并再次序列化，比较完整样例 JSON。
available_image_bounds 仍作为不解释的 JSON 保留；此字段的自定义内容不保证被上游接受。
