import 'package:flutter/material.dart';
import 'package:flutter_app_pagination/cell/grid_cell.dart';
import 'package:flutter_app_pagination/grid_detail.dart';
import 'package:flutter_app_pagination/model/photo.dart';
import 'package:flutter_app_pagination/network/network_request.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  gridView(AsyncSnapshot<List<Photo>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: snapshot.data!.map((photo) {
            return GestureDetector(
              child: GridTile(
                child: PhotoCell(photo),
              ),
              onTap: () {
                gotoDetailPage(context, photo);
              },
            );
          }).toList()),
    );
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
        title: const Text('GridView with Service'),
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
