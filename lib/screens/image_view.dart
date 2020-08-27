import 'package:flutter/material.dart';
import 'package:flutterunsplashgallary/models/image.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageViewScreen extends StatelessWidget {
  final UnsplashImage image;

  ImageViewScreen(this.image);

  Widget _buildBody(BuildContext context) {
    print(image.fullUrl);
    return Center(
      child: Stack(
        children: <Widget>[
          Center(child: CircularProgressIndicator()),
          Center(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: image.fullUrl,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(image.authorName),
      ),
      body: _buildBody(context),
    );
  }
}