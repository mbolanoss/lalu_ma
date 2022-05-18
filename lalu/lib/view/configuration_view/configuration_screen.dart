import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';
import 'package:lalu/utils/user_data.dart';
import 'package:lalu/widget/bottom_appbar.dart';
import 'package:lalu/widget/upper_appbar.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class ConfigurationScreen extends StatefulWidget {
  static final String title = 'Configuration';
  static const route = 'configuration';

  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  int _selectedItem=0;

  void onSelectItem(int index){
    setState(() =>
      _selectedItem=index
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final user = UserData.myUser;



    return Scaffold(
        appBar: UpperAppBar(context),
        backgroundColor: darkGray,
        bottomNavigationBar: BottomAppbar(
          onTap: onSelectItem,
          selectedItem: _selectedItem,
        ),
        body: Column(children: [
          Center(
            child: Container(
            
            decoration: BoxDecoration(
                color: Color(0xFFCA6BE5),
                borderRadius: BorderRadius.circular(100.0)),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal:10),
            child: Row(
              children: [
                // Photo
                Container(
                  width: screenSize.width * 0.25,
                  height: screenSize.height * 0.25,
                  
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/photo-1494790108377-be9c29b29330.jpg')
                  ),
                ),
                SizedBox(width: 20),
                // Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Text(
                      user.name,
                      style: TextStyle(
                        fontSize: screenSize.height * 0.025,
                        fontFamily: 'TrebuchetMS',
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      user.username,
                      style: TextStyle(
                        fontSize: screenSize.height * 0.025,
                        fontFamily: 'TrebuchetMS',
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      user.email,
                      style: TextStyle(
                        fontSize: screenSize.height * 0.025,
                        fontFamily: 'TrebuchetMS',
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),
              ],
            ),
          )),
          Container(
              child: SizedBox(
            height: screenSize.height * 0.09,
            child: Text(
              'Configuration',
              style: TextStyle(
                fontFeatures: [FontFeature.enable('smcp')],
                fontSize: screenSize.height * 0.04,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Autoplay text
                  Text(
                    'Activate autoplay',
                    style: TextStyle(
                      fontSize: screenSize.height * 0.03,
                      fontFamily: 'TrebuchetMS',
                      color: Colors.white,
                    ),
                  ),

                  // Switch
                  Container(
                    alignment: Alignment.topRight,
                    child: Transform.scale(
                      scale: 0.6,
                      child: LiteRollingSwitch(
                        value: true,
                        textOn: 'On',
                        textOff: 'Off',
                        colorOn: Color(0xFFCA6BE5),
                        colorOff: Colors.grey,
                        iconOn: CupertinoIcons.double_music_note,
                        iconOff: CupertinoIcons.double_music_note,
                        onChanged: (bool position) {
                          print("The button is $position");
                        },
                        onDoubleTap: (){},
                        onSwipe: (){},
                        onTap: (){},
                      ),
                    ),
                  ),
                ]),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
              height: screenSize.height * 0.09,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Autoplay text
                  Text(
                    'Download directory',
                    style: TextStyle(
                      fontSize: screenSize.height * 0.03,
                      fontFamily: 'TrebuchetMS',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 50, right: 30),
            child: SizedBox(
              height: screenSize.height * 0.03,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.folder_fill,
                        color: Colors.white,
                        size: screenSize.height * 0.02,
                      ),
                      // Autoplay text
                      Container(
                        padding: EdgeInsets.only(left: screenSize.width * 0.03),
                        child: Text(
                          'Download directory',
                          style: TextStyle(
                            fontSize: screenSize.height * 0.02,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Icon

                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.ellipsis_circle,
                        color: Colors.white,
                        size: screenSize.height * 0.03,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
