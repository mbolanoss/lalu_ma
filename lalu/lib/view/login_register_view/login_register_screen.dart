import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';
import 'package:lalu/view/login_register_view/login_register_tabs.dart';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  static const route = 'login_register';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: darkGray,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //Background imgs
            Positioned(
              top: screenSize.height * 0.8,
              left: screenSize.width * 0.55,
              child: const Image(
                image: AssetImage('assets/images/music_note.png'),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: screenSize.height * 0.85,
              right: screenSize.width * 0.45,
              child: const Image(
                image: AssetImage('assets/images/music_notes.png'),
                fit: BoxFit.cover,
              ),
            ),
            //Main content
            Container(
              margin: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.08,
                horizontal: screenSize.width * 0.1,
              ),
              child: Column(
                children: [
                  //Logo
                  Container(
                    margin: EdgeInsets.only(bottom: screenSize.height * 0.02),
                    width: screenSize.width * 0.6,
                    child: const Image(
                      image: AssetImage('assets/images/lalu_logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const LoginRegisterTabs(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
