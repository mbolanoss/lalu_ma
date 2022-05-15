import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';
import 'package:lalu/view/login_register_view/login_tabview.dart';
import 'package:lalu/view/login_register_view/register_tabview.dart';

class LoginRegisterTabs extends StatefulWidget {
  const LoginRegisterTabs({Key? key}) : super(key: key);

  @override
  State<LoginRegisterTabs> createState() => _LoginRegisterTabsState();
}

class _LoginRegisterTabsState extends State<LoginRegisterTabs>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        //Tabs
        TabBar(
          tabs: const [
            Tab(text: 'Sign Up'),
            Tab(text: 'Login'),
          ],
          indicatorColor: lightPink,
          indicatorWeight: 5,
          indicatorPadding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.1,
          ),
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 24,
              ),
          controller: tabController,
        ),

        //Tabs content
        SizedBox(
          width: double.infinity,
          height: screenSize.height * 0.95,
          child: TabBarView(
            controller: tabController,
            children: [
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.02),
                child: const RegisterTabView(),
              ),
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.02),
                child: const LoginTabView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
