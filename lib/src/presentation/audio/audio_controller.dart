import 'dart:collection';
import 'dart:developer' as dev;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'background_music.dart';

class AudioController extends StatefulWidget {
  const AudioController({super.key, required this.child});

  final Widget child;

  static AudioControllerState of(BuildContext context) {
    return context.findAncestorStateOfType<AudioControllerState>()!;
  }

  @override
  State<AudioController> createState() => AudioControllerState();
}

class AudioControllerState extends State<AudioController> {
  static const _bgmPlayerId = 'bgmPlayer';
  static const kDefaultVolume = 0.2;

  late final AppLifecycleListener _appLifecycleListener;
  late final AudioPlayer _bgmPlayer;
  late Queue<BackgroundMusic> _bgmPlaylist;

  bool isPlaying = false;
  ValueNotifier<String> artistName = ValueNotifier('');
  ValueNotifier<String> musicName = ValueNotifier('');
  ValueNotifier<double> volume = ValueNotifier(kDefaultVolume);

  bool _isRunning = false;

  @override
  void initState() {
    super.initState();

    _appLifecycleListener = AppLifecycleListener(
      onResume: () {
        if (isPlaying) {
          _bgmPlayer.resume();
        }
      },
      onInactive: () {
        if (isPlaying) {
          _bgmPlayer.pause();
        }
      },
      onStateChange: (AppLifecycleState newState) =>
          dev.log(name: 'OnAppStateChange', newState.name),
    );

    _bgmPlayer = AudioPlayer(playerId: _bgmPlayerId)..setVolume(kDefaultVolume);
    _bgmPlaylist =
        Queue.of(List<BackgroundMusic>.of(backgroundMusics)..shuffle());
    _bgmPlayer.onPlayerComplete.listen(nextBgm);
    artistName.value = _bgmPlaylist.first.artistName;
    musicName.value = _bgmPlaylist.first.musicName;
  }

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    _bgmPlayer.dispose();
    super.dispose();
  }

  Future<void> _playFirstBgm() async {
    await _bgmPlayer.stop();
    dev.log(name: 'Audio', 'Play Bgm: ${_bgmPlaylist.first.getInfo()}');
    await _bgmPlayer
        .play(AssetSource('sounds/bgm/${_bgmPlaylist.first.filename}'));
    isPlaying = true;
  }

  void nextBgm(void _) {
    dev.log(name: 'Audio', 'End Bgm: ${_bgmPlaylist.first.getInfo()}');
    _bgmPlaylist.addLast(_bgmPlaylist.removeFirst());
    artistName.value = _bgmPlaylist.first.artistName;
    musicName.value = _bgmPlaylist.first.musicName;

    if (_bgmPlayer.state == PlayerState.playing ||
        _bgmPlayer.state == PlayerState.completed) {
      _playFirstBgm();
    } else {
      _bgmPlayer.stop();
    }
  }

  void previousBgm() async {
    Duration? currentPosition = await _bgmPlayer.getCurrentPosition();

    if (_bgmPlayer.state == PlayerState.playing) {
      // While in playing state, when player's position is under 3 seconds, bring last bgm to first.
      if (currentPosition == null ||
          currentPosition.compareTo(const Duration(seconds: 3)) <= 0) {
        dev.log(name: 'Audio', 'End Bgm: ${_bgmPlaylist.first.getInfo()}');
        _bgmPlaylist.addFirst(_bgmPlaylist.removeLast());
        artistName.value = _bgmPlaylist.first.artistName;
        musicName.value = _bgmPlaylist.first.musicName;
      }

      _playFirstBgm();
    } else {
      _bgmPlayer.stop();
      dev.log(name: 'Audio', 'End Bgm: ${_bgmPlaylist.first.getInfo()}');
      _bgmPlaylist.addFirst(_bgmPlaylist.removeLast());
      artistName.value = _bgmPlaylist.first.artistName;
      musicName.value = _bgmPlaylist.first.musicName;
    }
  }

  void pauseBgm() {
    if (_bgmPlayer.state == PlayerState.playing) {
      dev.log(name: 'Audio', 'Pause Bgm: ${_bgmPlaylist.first.getInfo()}');
      _bgmPlayer.pause();
      isPlaying = false;
    }
  }

  Future<void> playBgm() async {
    switch (_bgmPlayer.state) {
      case PlayerState.paused:
        try {
          dev.log(name: 'Audio', 'Resume Bgm: ${_bgmPlaylist.first.getInfo()}');
          await _bgmPlayer.resume();
          isPlaying = true;
        } catch (e) {
          dev.log(name: 'Audio', 'Failed to resume bgm');
          await _playFirstBgm();
        }
        break;
      case PlayerState.stopped:
      case PlayerState.completed:
        await _playFirstBgm();
        break;
      case PlayerState.playing:
      case PlayerState.disposed:
        dev.log(name: 'Audio', 'Unexpected player state');
        break;
    }
  }

  Future<void> setBgmVolume(double newVolume) async {
    volume.value = newVolume;
    if (!_isRunning) {
      _isRunning = true;
      await _bgmPlayer.setVolume(newVolume).whenComplete(() {
        _isRunning = false;
        if (volume.value != newVolume) {
          setBgmVolume(volume.value);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
