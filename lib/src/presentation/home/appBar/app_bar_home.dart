import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../main.dart';
import '../../../config/theme_extension.dart';
import '../../../model/enum/language_code_enum.dart';
import 'button_audio_volume_control.dart';
import 'button_theme_toggle.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading(context),
      backgroundColor: Colors.transparent,
      shape: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
      ),
      leadingWidth: MediaQuery.sizeOf(context).width,
      forceMaterialTransparency: true,
    );
  }

  Widget leading(BuildContext context) {
    return Row(children: [
      const SizedBox(width: 12.0),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: FittedBox(
          child: DropdownMenu(
            width: 120,
            label: Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).extension<ExtensionColors>()!.textColor,
              ),
            ),
            initialSelection: LanguageLabel.english,
            onSelected: (LanguageLabel? language) {
              if (language != null) {
                MainApp.of(context).setLanguageCode(language.code);
              }
            },
            requestFocusOnTap: false,
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color:
                    Theme.of(context).extension<ExtensionColors>()!.textColor),
            dropdownMenuEntries: LanguageLabel.values
                .map<DropdownMenuEntry<LanguageLabel>>(
                    (LanguageLabel language) {
              return DropdownMenuEntry<LanguageLabel>(
                value: language,
                label: language.label,
                leadingIcon:
                    Image(width: 32.0, height: 32.0, image: language.image),
              );
            }).toList(),
          ),
        ),
      ),
      const SizedBox(width: 4.0),
      const ThemeToggleButton(),
      const Expanded(child: AudioVolumeControlButton()),
      const SizedBox(width: 12.0),
    ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
