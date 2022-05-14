class LoginFormVM {
  String? usernameValidator(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username can\'t be empty';
    }
    return null;
  }

  String? passwordValidator(String? username) {
    if (username == null || username.isEmpty) {
      return 'Password can\'t be empty';
    }
    return null;
  }
}

class RegisterFormVM {}

class LoginRegisterVM {}
