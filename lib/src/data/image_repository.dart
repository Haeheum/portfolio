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
  'america_flag.png',
  'army.png',
  'baby.png',
  'company.webp',
  'flutter.png',
  'folder_colored.png',
  'folder_disabled.png',
  'gisa.png',
  'hero.png',
  'knu.png',
  'korea_flag.png',
  'lol.png',
  'me.png',
  'toeic.png'
];
