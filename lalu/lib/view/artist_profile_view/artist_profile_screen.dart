import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalu/models/songData.dart';
import 'package:lalu/resources/colors.dart';
import 'package:lalu/utils/artist_data.dart';
import 'package:lalu/widget/bottom_appbar_dark.dart';
import 'package:lalu/widget/upper_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtistProfileScreen extends StatefulWidget {
  static final String title = 'Artist Profile';
  static const route = 'artist_profile';

  const ArtistProfileScreen({Key? key}) : super(key: key);

  @override
  State<ArtistProfileScreen> createState() => _ArtistProfileScreenState();
}

class _ArtistProfileScreenState extends State<ArtistProfileScreen> {
  int _selectedItem = 0;

  void onSelectItem(int index) {
    setState(() => _selectedItem = index);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final artist = ArtistData.myArtist;

    List<SongData> _songs = [
      SongData('Secret Love Song', '4:10'),
      SongData('Black Magic', '3:32'),
      SongData('Power', '4:08'),
      SongData('Woman Like Me', '3:50'),
      SongData('Sweet Melody', '3:34'),
      SongData('Little Me', '3:56'),
      SongData('Touch', '3:34'),
      SongData('Think About Us', '3:56'),
      SongData('Good Enough', '3:53'),
      SongData('Only You', '3:10'),
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [deepBlue, lightPurple],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
          appBar: UpperAppBar(context),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomDarkAppbar(
            onTap: onSelectItem,
            selectedItem: _selectedItem,
          ),
          body: SingleChildScrollView(
            child:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: screenSize.width * 0.04),
                      child: Text(
                        artist.name,
                        style: TextStyle(
                          fontFeatures: [FontFeature.enable('smcp')],
                          fontSize: screenSize.height * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 8,
                      width: screenSize.width,
                      margin: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.038,
                          vertical: screenSize.height * 0.015),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.white.withOpacity(0.3)),
                    ),
                    Center(
                        child: Container(
                      height: screenSize.height * 0.25,
                      decoration: BoxDecoration(
                          color: darkGray.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15.0)),
                      margin: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.038),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          // Photo
                          Container(
                            width: screenSize.width * 0.35,
                            height: screenSize.height * 0.35,
                            child: const CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/little-mix-between-us.jpg')),
                          ),

                          SizedBox(width: 20),
                          // Info
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenSize.width * 0.4,
                                      child: Text(
                                        artist.description,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontFamily: 'TrebuchetMS',
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(10),
                                            child: FaIcon(
                                              FontAwesomeIcons.instagram,
                                              color: Colors.white,
                                              size: screenSize.width * 0.07,
                                            )),
                                        Container(
                                            padding: EdgeInsets.all(10),
                                            child: FaIcon(
                                              FontAwesomeIcons.facebookSquare,
                                              color: Colors.white,
                                              size: screenSize.width * 0.07,
                                            )),
                                        Container(
                                            padding: EdgeInsets.all(10),
                                            child: FaIcon(
                                              FontAwesomeIcons.twitter,
                                              color: Colors.white,
                                              size: screenSize.width * 0.07,
                                            )),
                                      ],
                                    )
                                  ])),
                        ],
                      ),
                    )),
                    Container(
                      padding: EdgeInsets.only(
                          left: screenSize.width * 0.04,
                          top: screenSize.width * 0.02),
                      child: Text(
                        'Albums',
                        style: TextStyle(
                          fontFeatures: [FontFeature.enable('smcp')],
                          fontSize: screenSize.height * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: screenSize.width * 0.03,
                                  bottom: screenSize.height * 0.01),
                              height: screenSize.height * 0.1,
                              width: screenSize.width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Row(
                                children: [
                                  // Photo
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/little-mix-lm5.jpg')),
                                    ),
                                  ),

                                  // Info
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              screenSize.width * 0.015,
                                          vertical:
                                              screenSize.height * 0.012),
                                      child: Column(children: [
                                        SizedBox(
                                          width: screenSize.width * 0.2,
                                          child: Text(
                                            'LM5 \n13 songs \n1.8 Hour(s)',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'TrebuchetMS',
                                            ),
                                          ),
                                        ),
                                      ])),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: screenSize.width * 0.03,
                                  bottom: screenSize.height * 0.01),
                              height: screenSize.height * 0.1,
                              width: screenSize.width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Row(
                                children: [
                                  // Photo
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/little-mix-glorydays.jpg')),
                                    ),
                                  ),

                                  // Info
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              screenSize.width * 0.015,
                                          vertical:
                                              screenSize.height * 0.012),
                                      child: Column(children: [
                                        SizedBox(
                                          width: screenSize.width * 0.2,
                                          child: Text(
                                            'Glory Days \n17 songs \n2.6 Hour(s)',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'TrebuchetMS',
                                            ),
                                          ),
                                        ),
                                      ])),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: screenSize.width * 0.03,
                                  bottom: screenSize.height * 0.01),
                              height: screenSize.height * 0.1,
                              width: screenSize.width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Row(
                                children: [
                                  // Photo
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/little-mix-getweird.jpg')),
                                    ),
                                  ),

                                  // Info
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              screenSize.width * 0.015,
                                          vertical:
                                              screenSize.height * 0.012),
                                      child: Column(children: [
                                        SizedBox(
                                          width: screenSize.width * 0.2,
                                          child: Text(
                                            'Get Weird \n15 songs \n2.3 Hour(s)',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'TrebuchetMS',
                                            ),
                                          ),
                                        ),
                                      ])),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: screenSize.width * 0.03,
                                  bottom: screenSize.height * 0.01),
                              height: screenSize.height * 0.1,
                              width: screenSize.width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Row(
                                children: [
                                  // Photo
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/little-mix-confetti.png')),
                                    ),
                                  ),

                                  // Info
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              screenSize.width * 0.015,
                                          vertical:
                                              screenSize.height * 0.012),
                                      child: Column(children: [
                                        SizedBox(
                                          width: screenSize.width * 0.2,
                                          child: Text(
                                            'Confetti \n20 songs \n4.2 Hour(s)',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'TrebuchetMS',
                                            ),
                                          ),
                                        ),
                                      ])),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: screenSize.width * 0.04,
                          top: screenSize.width * 0.02),
                      child: Text(
                        'Popular Songs',
                        style: TextStyle(
                          fontFeatures: [FontFeature.enable('smcp')],
                          fontSize: screenSize.height * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          height: screenSize.height * 0.25,
                          decoration: BoxDecoration(
                              color: darkGray.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15.0)),
                          margin: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.038),
                          child: Row(
                            children: [
                              // Photo
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/hits.jpg')),
                                ),
                              ),

                              // Songs list
                              Column(
                                children: [
                                  SongContainer(song_name: _songs[0].name, song_duration: _songs[0].duration),
                                  SongContainer(song_name: _songs[1].name, song_duration: _songs[1].duration),
                                  SongContainer(song_name: _songs[2].name, song_duration: _songs[2].duration),
                                  SongContainer(song_name: _songs[3].name, song_duration: _songs[3].duration),
                                  SongContainer(song_name: _songs[4].name, song_duration: _songs[4].duration),
                                  SongContainer(song_name: _songs[5].name, song_duration: _songs[5].duration),
                                  SongContainer(song_name: _songs[6].name, song_duration: _songs[6].duration),
                                ],
                              )
                            ],
                          )),
                    )
                  ]),
          )),
    );
  }

SongContainer ({required String song_name, required String song_duration}){
  final screenSize = MediaQuery.of(context).size;
  return Row(
      children: [
        Container(
          width: screenSize.width * 0.42,
          height: 15,
          margin: EdgeInsets.only(
              left: 10, top: 6),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(10),
              color: Colors.white
                  .withOpacity(0.3)),
          child: Container(
            padding: EdgeInsets.only(left: 6, right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  song_name,
                  style: TextStyle(
                    fontFamily: 'TrebuchetMS',
                    fontSize: screenSize.height * 0.015,
                  ),
                ),
                Text(
                  song_duration,
                  style: TextStyle(
                    fontFamily: 'TrebuchetMS',
                    fontSize: screenSize.height * 0.015,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
}

}
