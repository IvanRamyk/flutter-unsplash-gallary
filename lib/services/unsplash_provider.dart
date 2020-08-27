import 'dart:convert';
import 'dart:io';

import 'package:flutterunsplashgallary/keys.dart';
import 'package:flutterunsplashgallary/models/image.dart';

class UnsplashImageProvider {
  static Future<UnsplashImage> loadImage(String id) async {
    String url = 'https://api.unsplash.com/photos/$id';
    var data = await _getImageData(url);
    return UnsplashImage.fromJson(data);
  }

  static Future<List> loadImages() async {
    String url = 'https://api.unsplash.com/photos';
    var data = await _getImageData(url);
    List<UnsplashImage> images =
    List<UnsplashImage>.generate(data.length, (index) {
      return UnsplashImage.fromJson(data[index]);
    });
    return images;
  }

  static dynamic _getImageData(String url) async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers
        .add('Authorization', 'Client-ID ${Keys.UNSPLASH_API_CLIENT_ID}');
    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      String json = await response.transform(utf8.decoder).join();
      return jsonDecode(json);
    } else {
      print("Http error: ${response.statusCode}");
      return [];
    }
  }
}