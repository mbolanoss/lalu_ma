import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';

class LoginRegisterFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool isPassword;
  final IconData iconData;
  bool isDate;

  LoginRegisterFormField(
      {Key? key,
      required this.hintText,
      this.validator,
      required this.isPassword,
      required this.iconData,
      this.onChanged,
      required this.isDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isDate ? TextInputType.datetime : TextInputType.text,
      validator: validator,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      cursorColor: lightPink,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: Icon(
          iconData,
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: lightPink, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[900],
      ),
      onChanged: onChanged,
    );
  }
}
