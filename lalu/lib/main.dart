import 'package:flutter/material.dart';
import 'package:lalu/resources/custom_theme.dart';
import 'package:lalu/view/login_register_view/login_register_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      initialRoute: LoginRegisterScreen.route,
      routes: {
        LoginRegisterScreen.route: (_) => const LoginRegisterScreen(),
      },
    );
  }
}
