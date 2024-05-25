import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resume/src/presentation/audio/audio_manager.dart';

import '../model/enum/language_code_enum.dart';
import 'app_state_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AudioWidget.of(context).previousBgm();
            },
            icon: const Icon(Icons.skip_previous),
          ),
          StatefulBuilder(builder: (_, StateSetter setState) {
            return IconButton(
              icon: AnimatedIcon(
                  icon: AnimatedIcons.play_pause,
                  progress: _animationController),
              onPressed: () {
                setState(() {
                  if (AudioWidget.of(context).isPlaying.value) {
                    _animationController.reverse();
                    AudioWidget.of(context).pauseBgm();
                  } else {
                    _animationController.forward();
                    AudioWidget.of(context).playBgm();
                  }
                });
              },
            );
          }),
          IconButton(
            onPressed: () {
              AudioWidget.of(context).nextBgm(null);
            },
            icon: const Icon(Icons.skip_next),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: ValueListenableBuilder(
              valueListenable: AudioWidget.of(context).volume,
              builder: (context, volume, _) {
                return Slider(
                    value: volume,
                    onChanged: (volume) {
                      AudioWidget.of(context).setBgmVolume(volume);
                    });
              },
            ),
          ),
          IconButton(
            onPressed: () {
              AppStateWidget.of(context).toggleThemeMode();
            },
            icon: Icon(AppStateScope.of(context).themeMode == ThemeMode.light
                ? Icons.nightlight
                : Icons.wb_sunny),
          ),
          const SizedBox(width: 12),
          DropdownMenu(
            label: Text(AppLocalizations.of(context)!.language),
            initialSelection: LanguageLabel.korean,
            requestFocusOnTap: false,
            onSelected: (LanguageLabel? language) {
              if (language != null) {
                AppStateWidget.of(context).setLanguageCode(language.code);
              }
            },
            dropdownMenuEntries: LanguageLabel.values
                .map<DropdownMenuEntry<LanguageLabel>>(
                    (LanguageLabel language) {
              return DropdownMenuEntry<LanguageLabel>(
                value: language,
                label: language.label,
                leadingIcon:
                    Image(width: 32, height: 32, image: language.image),
              );
            }).toList(),
          ),
          const SizedBox(width: 12),
        ],
        toolbarHeight: 88,
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.title1),
      ),
    );
  }
}
