import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Hide the debug nammr in the app
      home: ImageViewer(),
    );
  }
}

class ImageViewer extends StatefulWidget {
  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  List<String> images = [
    "assets/w4-s2/bird.jpg",
    "assets/w4-s2/bird2.jpg",
    "assets/w4-s2/insect.jpg",
    "assets/w4-s2/girl.jpg",
    "assets/w4-s2/man.jpg",
  ];

  int currentIndex = 0;

  void _previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  void _nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _nextImage,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[currentIndex]),
      ),
    );
  }
}