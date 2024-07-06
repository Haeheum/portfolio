import 'dart:math';

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

  Future<Image> fetchImage({required bool willSucceed}) async {

    // Mock http request delay
    await Future.delayed(const Duration(seconds: 1));

    if (willSucceed) {
      int seed = Random().nextInt(100);
      return Image.network('https://picsum.photos/seed/$seed/200/300');
    } else {
      throw Exception('Failed to load image');
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
