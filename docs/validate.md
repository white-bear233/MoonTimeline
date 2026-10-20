# 校验（第 9 步）

validate.validate 返回含 code/severity/path/message 的诊断数组；has_errors 判断是否存在 Error。
结构错误和已知素材越界为 Error；未知时长、MissingReference、空 URL 为 Warning；
可用范围未知和零长度片段为 Info。未知并不等于越界，不猜测媒体长度。
只检查活动媒体的裁剪范围；不检查文件存在与网络可达性。禁用对象同样接受结构与范围校验。
范围使用秒数严格比较；JSON Pointer 路径沿用导入约定。
公开模型的结构检查复用导出器，目前结构错误返回首个，媒体检查继续收集多个诊断。
