import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../model/background_music.dart';

class AudioRepository{
  static final AudioRepository instance = AudioRepository._();

  AudioRepository._();

  factory AudioRepository() => instance;

  Future<void> preCacheAudios() async {
    List<String> musicFilePaths = backgroundMusics
        .map((music) => 'sounds/bgm/${music.filename}')
        .toList();

    List<Uri> loadedList = await AudioCache.instance.loadAll(musicFilePaths);
    debugPrint(loadedList.toString());

  }
}

const Set<BackgroundMusic> backgroundMusics = {
  BackgroundMusic(filename: 'bgm1.mp3', artistName: '별은', musicName: '생일 축하해 (With. 정유빈)'),
  BackgroundMusic(filename: 'bgm2.mp3', artistName: '별은', musicName: 'Quest'),
  BackgroundMusic(filename: 'bgm3.mp3', artistName: '별은', musicName: '꼭'),
};