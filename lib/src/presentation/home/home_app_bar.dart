import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../main.dart';
import '../../model/enum/language_code_enum.dart';
import '../scope/app_state_scope.dart';
import '../audio/audio_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  static const double _myAppbarHeight = 88.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        const Icon(Icons.volume_down_rounded),
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
        const SizedBox(width: 12.0),
        DropdownMenu(
          label: Text(AppLocalizations.of(context)!.language),
          initialSelection: LanguageLabel.english,
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
              leadingIcon: Image(width: 32.0, height: 32.0, image: language.image),
            );
          }).toList(),
        ),
        const SizedBox(width: 12.0),
      ],
      toolbarHeight: _myAppbarHeight,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_myAppbarHeight);
}
