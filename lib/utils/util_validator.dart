/// 检查邮箱格式
bool checkIsEmail(String? input) {
  if (input == null || input.isEmpty) return false;
  // 邮箱正则
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(input);
}

bool checkPhone(String? input) {
  if (input == null || input.isEmpty) return false;
  // 邮箱正则
  String regex =r'^1[3-9]\d{9}$';
  return RegExp(regex).hasMatch(input);
}

// 检查密码格式 6-12位，包含字母和数字
bool checkPasswordIsValid(String input){
  String regex = r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]+\S{5,12}$';
  return RegExp(regex).hasMatch(input);
}


/// 检查字符长度
bool checkStringLength(String? input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length >= length;
}
