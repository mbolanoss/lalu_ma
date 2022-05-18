import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginTabView extends StatelessWidget {
  const LoginTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
          child: Text(
            'Nice to see you again!',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        LoginForm(),
      ],
    );
  }
}
