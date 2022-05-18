import 'package:flutter/material.dart';

class PlaylistsSection extends StatelessWidget {
  final _scrollController = ScrollController();

  PlaylistsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scrollbar(
      thumbVisibility: true,
      controller: _scrollController,
      child: GridView.count(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: [],
      ),
    );
  }
}
