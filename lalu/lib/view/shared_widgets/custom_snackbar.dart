import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';

getCustomSnackBar(BuildContext context, Widget content) {
  final screenSize = MediaQuery.of(context).size;

  return SnackBar(
    backgroundColor: deepPurple,
    shape: const StadiumBorder(),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: screenSize.height * 0.015,
      left: screenSize.width * 0.01,
      right: screenSize.width * 0.02,
    ),
    content: content,
  );
}
