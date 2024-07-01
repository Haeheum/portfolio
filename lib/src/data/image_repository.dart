import 'package:flutter/material.dart';

class ImageRepository {
  static final ImageRepository instance = ImageRepository._();

  ImageRepository._();

  factory ImageRepository() => instance;

  Future<void> preCacheImages(BuildContext context) async {
    for (String fileName in rawImageData) {
      precacheImage(AssetImage('assets/images/$fileName'), context);
    }
  }
}

const List<String> rawImageData = [
  'flag_america.png',
  'flag_korea.png',
  'folder_colored.png',
  'folder_disabled.png',
  'hero.png',
  'me.jpeg',
  'singer.webp',
];
