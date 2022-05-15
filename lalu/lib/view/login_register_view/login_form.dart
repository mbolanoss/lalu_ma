import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';
import 'package:lalu/view/shared_widgets/login_register_form_field.dart';
import 'package:lalu/view_model/login_register_vm.dart';

class LoginForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final viewModel = LoginVM();

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          //Username input
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.02,
              bottom: screenSize.height * 0.01,
            ),
            child: LoginRegisterFormField(
              iconData: Icons.account_circle_rounded,
              hintText: 'Username',
              isPassword: false,
              isDate: false,
              validator: (username) => viewModel.usernameValidator(username),
              onChanged: (username) => viewModel.setUsername = username ?? '',
            ),
          ),

          //Password input
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.01,
              bottom: screenSize.height * 0.02,
            ),
            child: LoginRegisterFormField(
              iconData: Icons.lock,
              hintText: 'Password',
              isPassword: true,
              isDate: false,
              validator: (password) => viewModel.passwordValidator(password),
              onChanged: (password) => viewModel.setPassword = password ?? '',
            ),
          ),

          //Login button
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.04),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: lightPink,
                shape: const StadiumBorder(),
                padding:
                    EdgeInsets.symmetric(vertical: screenSize.height * 0.015),
              ),
              child: Text(
                'Feel the music!',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
