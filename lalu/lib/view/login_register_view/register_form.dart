import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';
import 'package:lalu/view/shared_widgets/login_register_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Form(
      child: Column(
        children: [
          //First name
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.02,
              bottom: screenSize.height * 0.005,
            ),
            child: const LoginRegisterFormField(
              iconData: Icons.account_circle_rounded,
              hintText: 'First name',
              isPassword: false,
            ),
          ),

          //Last name
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: const LoginRegisterFormField(
              iconData: Icons.lock,
              hintText: 'Last name',
              isPassword: false,
            ),
          ),

          //Username
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: const LoginRegisterFormField(
              iconData: Icons.account_circle_rounded,
              hintText: 'Username',
              isPassword: false,
            ),
          ),

          //Email
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: const LoginRegisterFormField(
              iconData: Icons.email,
              hintText: 'Email',
              isPassword: false,
            ),
          ),

          //Birth date
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: const LoginRegisterFormField(
              iconData: Icons.calendar_month,
              hintText: 'Birth date',
              isPassword: false,
            ),
          ),

          //Password
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: const LoginRegisterFormField(
              iconData: Icons.lock,
              hintText: 'Password',
              isPassword: true,
            ),
          ),

          //Confirm password
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: const LoginRegisterFormField(
              iconData: Icons.lock_reset,
              hintText: 'Confirm password',
              isPassword: true,
            ),
          ),

          //Register button
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.03),
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
                'Rock up!',
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
