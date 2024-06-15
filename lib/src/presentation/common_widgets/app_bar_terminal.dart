import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/theme_extension.dart';
import '../home/appBar/button_theme_toggle.dart';

class AppBarTerminal extends StatefulWidget implements PreferredSizeWidget {
  const AppBarTerminal({super.key});

  @override
  State<AppBarTerminal> createState() => _AppBarTerminalState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarTerminalState extends State<AppBarTerminal> {
  bool _onHover = false;
  bool _onHoverBackButton = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _onHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          _onHover = false;
        });
      },
      child: AnimatedContainer(
        height: widget.preferredSize.height,
        decoration: BoxDecoration(
          color: _onHover
              ? Theme.of(context)
                  .extension<ExtensionColors>()!
                  .terminalAppBarColor
              : Theme.of(context)
                  .extension<ExtensionColors>()!
                  .terminalUnfocusedAppBarColor,
        ),
        duration: const Duration(milliseconds: 50),
        child: Row(
          children: [
            const SizedBox(width: 18),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      _onHoverBackButton = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _onHoverBackButton = false;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: _onHover
                        ? const Color(0xFFF45D55)
                        : Theme.of(context)
                            .extension<ExtensionColors>()!
                            .terminalUnfocusedAppBarTextColor,
                    radius: 14,
                    child: _onHoverBackButton
                        ? const Icon(
                            CupertinoIcons.clear_thick,
                      size: 18.0,
                            color: Colors.black,
                          )
                        : null,
                  ),
                )),
            const SizedBox(width: 12),
            const ThemeToggleButton(),
          ],
        ),
      ),
    );
  }
}
