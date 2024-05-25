const Set<BackgroundMusic> backgroundMusics = {
  BackgroundMusic(filename: 'bgm1.mp3', artistName: '별은', musicName: 'Family (Prod. by 조성태)'),
  BackgroundMusic(filename: 'bgm2.mp3', artistName: '별은', musicName: 'Quest'),
  BackgroundMusic(filename: 'bgm3.mp3', artistName: '별은', musicName: '꼭'),
  BackgroundMusic(filename: 'bgm4.mp3', artistName: '별은', musicName: '생일 축하해 (With. 정유빈)'),
  BackgroundMusic(filename: 'bgm5.mp3', artistName: '헤르쯔 아날로그 (Herz Analog)', musicName: 'Love Song (Feat. 별은)'),
};

class BackgroundMusic {
  final String filename;
  final String artistName;
  final String musicName;

  const BackgroundMusic({required this.filename, this.artistName = 'unknown', this.musicName = 'unknown'});

  String getInfo() => '$artistName - $musicName';
}
