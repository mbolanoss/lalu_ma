import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/resources/colors.dart';
import 'package:lalu/view/shared_widgets/custom_snackbar.dart';
import 'package:lalu/view/shared_widgets/login_register_form_field.dart';
import 'package:lalu/view_model/login_register_vm.dart';

class RegisterForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final viewModel = RegisterVM();

    final graphqlClient = GraphQLProvider.of(context).value;

    return Form(
      key: formKey,
      child: Column(
        children: [
          //First name
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.02,
              bottom: screenSize.height * 0.005,
            ),
            child: LoginRegisterFormField(
              iconData: Icons.account_circle_rounded,
              hintText: 'First name',
              isPassword: false,
              isDate: false,
              onChanged: (firstName) =>
                  viewModel.setFirstName = firstName ?? '',
              validator: (firstName) => viewModel.firstNameValidator(firstName),
            ),
          ),

          //Last name
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: LoginRegisterFormField(
              iconData: Icons.lock,
              hintText: 'Last name',
              isPassword: false,
              isDate: false,
              onChanged: (lastName) => viewModel.setLastName = lastName ?? '',
              validator: (lastName) => viewModel.lastNameValidator(lastName),
            ),
          ),

          //Username
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: LoginRegisterFormField(
              iconData: Icons.account_circle_rounded,
              hintText: 'Username',
              isPassword: false,
              isDate: false,
              onChanged: (username) => viewModel.setUsername = username ?? '',
              validator: (username) => viewModel.usernameValidator(username),
            ),
          ),

          //Email
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: LoginRegisterFormField(
              iconData: Icons.email,
              hintText: 'Email',
              isPassword: false,
              isDate: false,
              onChanged: (email) => viewModel.setEmail = email ?? '',
              validator: (email) => viewModel.emailValidator(email),
            ),
          ),

          //Birth date
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: LoginRegisterFormField(
              iconData: Icons.calendar_month,
              hintText: 'Birth date',
              isPassword: false,
              isDate: true,
              onChanged: (date) => viewModel.setBirthDate = date ?? '',
              validator: (date) => viewModel.birthDateValidator(date),
            ),
          ),

          //Password
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: LoginRegisterFormField(
              iconData: Icons.lock,
              hintText: 'Password',
              isPassword: true,
              isDate: false,
              onChanged: (password) => viewModel.setPassword = password ?? '',
              validator: (password) => viewModel.passwordValidator(password),
            ),
          ),

          //Confirm password
          Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.005,
              bottom: screenSize.height * 0.005,
            ),
            child: LoginRegisterFormField(
              iconData: Icons.lock_reset,
              hintText: 'Confirm password',
              isPassword: true,
              isDate: false,
              onChanged: (confirmPassword) =>
                  viewModel.setConfirmPassword = confirmPassword ?? '',
              validator: (confirmPassword) =>
                  viewModel.confirmPasswordValidator(confirmPassword),
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
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  viewModel.register(graphqlClient).then((result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      getCustomSnackBar(
                        context,
                        Text(
                          result.hasException
                              ? 'Something went wrong'
                              : 'You can login now!',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    );

                    if (!result.hasException) {
                      formKey.currentState!.reset();
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
