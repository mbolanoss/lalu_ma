import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';

class SongInfo extends StatelessWidget {
  const SongInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        //Song name
        Text(
          'Physical',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        //Song artist
        Text(
          'Dua Lipa',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),

        SizedBox(
          height: screenSize.height * 0.04,
        ),

        //Remaining song info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //Album
          children: const [
            _SongInfoPiece(
              name: 'Album',
              value: 'Future Nostalgia',
            ),
            _SongInfoPiece(
              name: 'Likes',
              value: '1M',
            ),
            _SongInfoPiece(
              name: 'Year',
              value: '2021',
            ),
          ],
        )
      ],
    );
  }
}

class _SongInfoPiece extends StatelessWidget {
  final String name;
  final String value;
  const _SongInfoPiece({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        //Name
        Container(
          margin: EdgeInsets.only(bottom: screenSize.height * 0.015),
          padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.002),
          width: screenSize.width * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFAD81CC),
          ),
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        //Value
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
