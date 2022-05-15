import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/models/user_register.dart';
import 'package:lalu/repository/login_register_repo.dart';

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

class RegisterVM {
  UserRegister user = UserRegister();
  LoginRegisterRepo repo = LoginRegisterRepo();

  set setFirstName(String newVal) {
    user.firstName = newVal;
  }

  set setLastName(String newVal) {
    user.lastName = newVal;
  }

  set setUsername(String newVal) {
    user.username = newVal;
  }

  set setPassword(String newVal) {
    user.password = newVal;
  }

  set setConfirmPassword(String newVal) {
    user.confirmPassword = newVal;
  }

  set setEmail(String newVal) {
    user.email = newVal;
  }

  set setBirthDate(String newVal) {
    user.birthDate = newVal;
  }

  String? firstNameValidator(String? firstName) {
    if (firstName == null || firstName.isEmpty) {
      return 'First name can\'t be empty';
    }
    return null;
  }

  String? lastNameValidator(String? lastName) {
    if (lastName == null || lastName.isEmpty) {
      return 'Last name can\'t be empty';
    }
    return null;
  }

  String? usernameValidator(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username can\'t be empty';
    }
    return null;
  }

  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email can\'t be empty';
    }

    const emailRegExp =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    bool emailValid = RegExp(emailRegExp).hasMatch(email);

    if (!emailValid) {
      return "Invalid email";
    }

    return null;
  }

  String? birthDateValidator(String? date) {
    if (date == null || date.isEmpty) {
      return 'Birth date can\'t be empty';
    }

    /* const dateRegExp =
        r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" */

    const dateRegExp = r"^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$";

    bool dateValid = RegExp(dateRegExp).hasMatch(date);

    if (!dateValid) {
      return "Invalid date (YYYY-MM-DD)";
    }

    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password can\'t be empty';
    }
    if (password != user.confirmPassword) {
      return 'Passwords don\'t match';
    }
    return null;
  }

  String? confirmPasswordValidator(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Password can\'t be empty';
    }
    if (confirmPassword != user.password) {
      return 'Passwords don\'t match';
    }
    return null;
  }

  Future<QueryResult> register(GraphQLClient client) {
    /* final test = UserRegister();
    test.firstName = "Juan";
    test.lastName = "Herrera";
    test.birthDate = "1990-12-16";
    test.username = "juanh";
    test.email = "junah@gmail.com";
    test.password = "1234";
    test.confirmPassword = "1234"; */
    return repo.registerUser(client, user);
  }
}
