import 'package:flutter/material.dart';
import 'package:flutter_app_pagination/cell/grid_cell.dart';
import 'package:flutter_app_pagination/grid_detail.dart';
import 'package:flutter_app_pagination/model/photo.dart';
import 'package:flutter_app_pagination/network/network_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  gridView(AsyncSnapshot<List<Photo>> snapshot) {
    return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        children: snapshot.data!.map((photo) {
          return GestureDetector(
            child: GridTile(
              child: PhotoCell(photo),
            ),
            onTap: () {
              gotoDetailPage(context, photo);
            },
          );
        }).toList());
  }

  gotoDetailPage(BuildContext context, Photo photo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => GridDetails(photo: photo),
      ),
    );
  }

  circularProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FutureBuilder<List<Photo>>(
              future: NetworkRequest.fetchPhotos(),
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                } else {
                  if (snapshot.hasData) {
                    return gridView(snapshot);
                  }
                  return circularProgress();
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
