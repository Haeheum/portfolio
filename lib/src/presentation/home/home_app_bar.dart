import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resume/src/presentation/home/animated_play_button.dart';

import '../../../main.dart';
import '../../model/enum/language_code_enum.dart';
import '../scope/app_state_scope.dart';
import '../audio/audio_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  static const double _myAppbarHeight = 88;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: AudioController.of(context).previousBgm,
          icon: const Icon(Icons.skip_previous),
        ),
        const AnimatedPlayButton(),
        IconButton(
          onPressed: () {
            AudioController.of(context).nextBgm(null);
          },
          icon: const Icon(Icons.skip_next),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: ValueListenableBuilder(
            valueListenable: AudioController.of(context).volume,
            builder: (context, volume, _) {
              return Slider(
                value: volume,
                onChanged: (newVolume) {
                  AudioController.of(context).setBgmVolume(newVolume);
                },
                max: 0.6,
              );
            },
          ),
        ),
        IconButton(
          onPressed: MainApp.of(context).toggleThemeMode,
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
              MainApp.of(context).setLanguageCode(language.code);
            }
          },
          dropdownMenuEntries: LanguageLabel.values
              .map<DropdownMenuEntry<LanguageLabel>>((LanguageLabel language) {
            return DropdownMenuEntry<LanguageLabel>(
              value: language,
              label: language.label,
              leadingIcon: Image(width: 32, height: 32, image: language.image),
            );
          }).toList(),
        ),
        const SizedBox(width: 12),
      ],
      toolbarHeight: _myAppbarHeight,
      forceMaterialTransparency: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_myAppbarHeight);
}
