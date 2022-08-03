import 'package:flutter/material.dart';
import 'model/photo.dart';

class GridDetails extends StatefulWidget {
  final Photo photo;
  GridDetails({required this.photo});

  @override
  State<GridDetails> createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close_outlined)),
                OutlinedButton(
                    onPressed: () {}, child: const Icon(Icons.share_outlined)),
              ],
            ),
            const SizedBox(height: 50),
            Hero(
              tag: 'image${widget.photo.id}',
              child: FadeInImage.assetNetwork(
                placeholder: 'images/no_image.png',
                image: widget.photo.url,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
