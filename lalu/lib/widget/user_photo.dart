import 'package:flutter/material.dart';

class UserPhotoWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const UserPhotoWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: buildImage(),
    );
  }

  Widget buildImage(){
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Ink.image(
        image: image,
        fit: BoxFit.cover,
        width: 128,
        height: 128,
        )
      );
  }

}