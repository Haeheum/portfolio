import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import '../../../config/theme_extension.dart';
import '../../../model/enum/language_options.dart';
import '../../state_management/app_state_scope.dart';
import 'button_audio_volume_control.dart';
import 'button_theme_toggle.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

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
              S.of(context).language,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context)
                        .extension<ExtensionColors>()!
                        .textColor,
                  ),
            ),
            initialSelection: switch (
                AppStateScope.of(context).appLocale.languageCode) {
              'en' => LanguageOptions.english,
              'ko' => LanguageOptions.korean,
              _ => throw UnsupportedError('Unsupported Language')
            },
            onSelected: (LanguageOptions? language) {
              if (language != null) {
                MainApp.of(context).setLanguageCode(language.code);
              }
            },
            requestFocusOnTap: false,
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color:
                    Theme.of(context).extension<ExtensionColors>()!.textColor),
            dropdownMenuEntries: LanguageOptions.values
                .map<DropdownMenuEntry<LanguageOptions>>(
                    (LanguageOptions language) {
              return DropdownMenuEntry<LanguageOptions>(
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
      const ButtonThemeToggle(),
      const Expanded(child: ButtonAudioVolumeControl()),
      const SizedBox(width: 12.0),
    ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
