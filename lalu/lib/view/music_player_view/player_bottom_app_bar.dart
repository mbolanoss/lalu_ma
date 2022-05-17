import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/music_player_provider.dart';

class BottomAppBarContent extends StatelessWidget {
  const BottomAppBarContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final playerProvider =
        Provider.of<MusicPlayerProvider>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Player control buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.shuffle),
              onPressed: () {},
            ),
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.skip_previous_outlined),
              onPressed: () {},
            ),

            //Empty space for play/pause button
            SizedBox(width: screenSize.width * 0.15),

            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.skip_next_outlined),
              onPressed: () {},
            ),
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.repeat),
              onPressed: () {},
            ),
          ],
        ), //Volume control slider

        //Volume control slider
        //TODO: Replace with volume control
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.volume_down,
              color: Colors.white,
            ),
            Slider(
              value: 5,
              onChanged: (val) {},
              min: 0,
              max: 10,
            ),
            const Icon(
              Icons.volume_up,
              color: Colors.white,
            ),
          ],
        ),

        //Song interactions buttons
        Container(
          margin: EdgeInsets.only(bottom: screenSize.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Like button
              Ink(
                width: screenSize.width * 0.11,
                decoration: const ShapeDecoration(
                  color: Color(0xFFC09DC9),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  //highlightColor: Color(0xFFC09DC9),
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),

              SizedBox(width: screenSize.width * 0.1),

              //Share button
              Ink(
                width: screenSize.width * 0.11,
                decoration: const ShapeDecoration(
                  color: Color(0xFFC09DC9),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
