import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';
import 'package:lalu/view/shared_widgets/login_register_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          //Username
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.02,
              bottom: screenSize.height * 0.01,
            ),
            child: const LoginRegisterFormField(
              iconData: Icons.account_circle_rounded,
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
            child: const LoginRegisterFormField(
              iconData: Icons.lock,
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
