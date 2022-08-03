import 'package:flutter/material.dart';
import '../model/photo.dart';

class PhotoCell extends StatelessWidget {
  @required
  final Photo photo;

  const PhotoCell(this.photo);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Hero(
            tag: 'Image${photo.id}',
            child: FadeInImage.assetNetwork(
              placeholder: 'images/no_image.png',
              image: photo.thumbnailUrl,
              width: 130,
              height: 130,
            ),
          ),
        ),
      ],
    );
  }
}
