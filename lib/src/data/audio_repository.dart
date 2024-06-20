import 'package:audioplayers/audioplayers.dart';

import '../model/background_music.dart';

class AudioRepository {
  static final AudioRepository instance = AudioRepository._();

  AudioRepository._();

  factory AudioRepository() => instance;

  Future<void> preCacheAudios() async {
    List<String> musicFilePaths = backgroundMusics
        .map((music) => 'sounds/bgm/${music.filename}')
        .toList();

    await AudioCache.instance.loadAll(musicFilePaths);
  }
}

const Set<BackgroundMusic> backgroundMusics = {
  BackgroundMusic(
      filename: 'bgm1.m4a', artistName: '별은', musicName: '다시 시작된 꿈처럼'),
  BackgroundMusic(
      filename: 'bgm2.m4a',
      artistName: '어쿠레인',
      musicName: '내게도 봄이 올까요 (Feat. 은비 (별은))'),
  BackgroundMusic(
      filename: 'bgm3.m4a', artistName: '별은', musicName: '생일 축하해 (With. 정유빈)'),
};
