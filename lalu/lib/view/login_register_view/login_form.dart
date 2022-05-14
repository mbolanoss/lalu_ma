import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Form(
      child: Column(
        children: [
          //Username
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.02,
              bottom: screenSize.height * 0.01,
            ),
            child: LoginFormField(
              hintText: 'Username',
              isPassword: false,
            ),
          ),

          //Password
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.01,
              bottom: screenSize.height * 0.02,
            ),
            child: const LoginFormField(
              hintText: 'Password',
              isPassword: true,
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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class LoginFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPassword;

  const LoginFormField({
    Key? key,
    required this.hintText,
    this.validator,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      cursorColor: lightPink,
      decoration: InputDecoration(
        hintText: 'Username',
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: Icon(
          isPassword ? Icons.lock : Icons.account_circle,
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: lightPink, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[900],
      ),
    );
  }
}
