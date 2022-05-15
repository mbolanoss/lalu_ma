class LoginVM {
  String username = '';
  String password = '';

  set setUsername(String newVal) {
    username = newVal;
  }

  set setPassword(String newVal) {
    password = newVal;
  }

  String? usernameValidator(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username can\'t be empty';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password can\'t be empty';
    }
    return null;
  }
}

class RegisterVM {}
