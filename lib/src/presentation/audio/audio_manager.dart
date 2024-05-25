import 'dart:collection';
import 'dart:developer' as dev;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'background_music.dart';

class AudioWidget extends StatefulWidget {
  const AudioWidget({super.key, required this.child});

  final Widget child;

  static AudioWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AudioWidgetState>()!;
  }

  @override
  State<AudioWidget> createState() => AudioWidgetState();
}

class AudioWidgetState extends State<AudioWidget> {
  static const _bgmPlayerId = 'bgmPlayer';
  static const _initialVolume = 0.2;

  late final AppLifecycleListener _appLifecycleListener;
  late final AudioPlayer _bgmPlayer;
  late Queue<BackgroundMusic> _bgmPlaylist;

  ValueNotifier<bool> isPlaying = ValueNotifier(false);
  ValueNotifier<double> volume = ValueNotifier(_initialVolume);

  @override
  void initState() {
    super.initState();

    _appLifecycleListener = AppLifecycleListener(
      onResume: () {
        if (isPlaying.value) {
          _bgmPlayer.resume();
        }
      },
      onInactive: () {
        if (isPlaying.value) {
          _bgmPlayer.pause();
        }
      },
      onStateChange: (AppLifecycleState newState) =>
          dev.log(name: 'OnAppStateChange', newState.name),
    );

    _bgmPlayer = AudioPlayer(playerId: _bgmPlayerId)..setVolume(_initialVolume);
    _bgmPlaylist =
        Queue.of(List<BackgroundMusic>.of(backgroundMusics)..shuffle());
    _bgmPlayer.onPlayerComplete.listen(nextBgm);
  }

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    _bgmPlayer.dispose();
    super.dispose();
  }

  Future _playFirstBgm() async {
    dev.log(name: 'Audio', 'Play Bgm: ${_bgmPlaylist.first.getInfo()}');
    await _bgmPlayer
        .play(AssetSource('sounds/bgm/${_bgmPlaylist.first.filename}'));
    isPlaying.value = true;
  }

  void nextBgm(_) {
    dev.log(name: 'Audio', 'End Bgm: ${_bgmPlaylist.first.getInfo()}');
    _bgmPlaylist.addLast(_bgmPlaylist.removeFirst());

    if (_bgmPlayer.state == PlayerState.playing ||
        _bgmPlayer.state == PlayerState.completed) {
      _playFirstBgm();
    } else {
      _bgmPlayer.stop();
    }
  }

  void previousBgm() async {
    Duration? currentPosition = await _bgmPlayer.getCurrentPosition();

    //While playing,
    if (_bgmPlayer.state == PlayerState.playing) {
      // When player's position is under 3 seconds, bring last bgm to first.
      if (currentPosition == null ||
          currentPosition.compareTo(const Duration(seconds: 3)) <= 0) {
        dev.log(name: 'Audio', 'End Bgm: ${_bgmPlaylist.first.getInfo()}');
        _bgmPlaylist.addFirst(_bgmPlaylist.removeLast());
      }

      _playFirstBgm();
    } else {
      dev.log(name: 'Audio', 'End Bgm: ${_bgmPlaylist.first.getInfo()}');
      _bgmPlaylist.addFirst(_bgmPlaylist.removeLast());
    }
  }

  void pauseBgm() {
    if (_bgmPlayer.state == PlayerState.playing) {
      dev.log(name: 'Audio', 'Pause Bgm: ${_bgmPlaylist.first.getInfo()}');
      _bgmPlayer.pause();
      isPlaying.value = false;
    }
  }

  Future playBgm() async {
    switch (_bgmPlayer.state) {
      case PlayerState.paused:
        try {
          dev.log(name: 'Audio', 'Resume Bgm: ${_bgmPlaylist.first.getInfo()}');
          await _bgmPlayer.resume();
          isPlaying.value = true;
        } catch (e) {
          dev.log(name: 'AudioError', e.toString());
          await _playFirstBgm();
        }
        break;
      case PlayerState.stopped:
      case PlayerState.completed:
        await _playFirstBgm();
        break;
      case PlayerState.playing:
        dev.log(
            name: 'AudioException',
            'Already playing Bgm: ${_bgmPlaylist.first.getInfo()}');
        break;
      case PlayerState.disposed:
        dev.log(name: 'AudioError', 'Player disposed');
        break;
    }
  }

  Future setBgmVolume(double newVolume) async {
    await _bgmPlayer.setVolume(newVolume);
    volume.value = newVolume;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
