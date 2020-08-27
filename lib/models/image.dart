import 'dart:ui';

class UnsplashImage {
  String id;
  String authorUsername;
  String authorName;
  String description;
  String altDescription;
  String smallUrl;
  String fullUrl;
  int height;
  int width;

  UnsplashImage({this.id, this.description, this.altDescription, this.authorName,
    this.authorUsername, this.fullUrl, this.smallUrl, this.width, this.height});

  factory UnsplashImage.fromJson(Map<String, dynamic> json) {
    return new UnsplashImage(
      id: json['id'],
      description: json['description'],
      altDescription: json['alt_description'],
      authorUsername: json['user']['username'],
      authorName: json['user']['name'],
      fullUrl: json['urls']['full'],
      smallUrl: json['urls']['small'],
      height: json['height'],
      width: json['width'],
    );
  }
}