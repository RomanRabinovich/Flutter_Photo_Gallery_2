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
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'image${widget.photo.id}',
              child: FadeInImage.assetNetwork(
                placeholder: 'images/no_image.png',
                image: widget.photo.url,
              ),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}
