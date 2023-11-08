import 'package:get/get.dart';

class LoginState {
  LoginState() {
    ///Initialize variables
  }

  final _clickable = false.obs;

  get clickable => _clickable.value;

  set clickable(value) => _clickable.value = value;
}
