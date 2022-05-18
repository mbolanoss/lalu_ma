import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/providers/session_provider.dart';
import 'package:lalu/resources/colors.dart';
import 'package:lalu/services/secure_storage_service.dart';
import 'package:lalu/view/library_view/library_screen.dart';
import 'package:lalu/view/shared_widgets/login_register_form_field.dart';
import 'package:lalu/view_model/login_register_vm.dart';
import 'package:provider/provider.dart';

import '../shared_widgets/custom_snackbar.dart';

class LoginForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final viewModel = LoginVM();

    final graphqlClient = GraphQLProvider.of(context).value;

    final secureStorage = SecureStorage();

    final sessionProvider = Provider.of<SessionProvider>(context);

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

          //Email input
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.01,
              bottom: screenSize.height * 0.01,
            ),
            child: LoginRegisterFormField(
              iconData: Icons.email,
              hintText: 'Email',
              isPassword: false,
              isDate: false,
              validator: (email) => viewModel.emailValidator(email),
              onChanged: (email) => viewModel.setEmail = email ?? '',
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
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  viewModel.login(graphqlClient).then((result) {
                    final token = result.data!['loginUser'];

                    // On error
                    if (result.hasException || token == "User login failed") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        getCustomSnackBar(
                          context,
                          Text(
                            result.hasException
                                ? 'Something went wrong'
                                : token == "User login failed"
                                    ? 'Wrong credentials'
                                    : '',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      );
                    }

                    // Succesfull login
                    else {
                      secureStorage.writeSecureData("sessionToken", token);

                      sessionProvider.username = viewModel.username;

                      Navigator.of(context)
                          .pushReplacementNamed(LibraryScreen.route);
                    }
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
