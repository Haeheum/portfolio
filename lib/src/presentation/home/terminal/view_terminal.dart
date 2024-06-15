import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../config/theme_extension.dart';

class TerminalView extends StatefulWidget {
  const TerminalView({super.key, this.message});

  final String? message;

  @override
  State<TerminalView> createState() => _TerminalViewState();
}

class _TerminalViewState extends State<TerminalView> {
  bool _onHover = false;
  late String _consoleMessage;

  @override
  Widget build(BuildContext context) {
    _consoleMessage = widget.message ?? S.of(context).myMessage;

    return Expanded(
      child: Center(
        child: MouseRegion(
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
          child: Hero(
            tag: 'hero',
            child: Card(
              elevation: _onHover ? 15 : 0,
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  AnimatedContainer(
                    decoration: BoxDecoration(
                      color: _onHover
                          ? Theme.of(context)
                              .extension<ExtensionColors>()!
                              .terminalAppBarColor
                          : Theme.of(context)
                              .extension<ExtensionColors>()!
                              .terminalUnfocusedAppBarColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    height: 27.0,
                    duration: const Duration(milliseconds: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 9),
                            CircleAvatar(
                              backgroundColor: _onHover
                                  ? const Color(0xFFF45D55)
                                  : Theme.of(context)
                                      .extension<ExtensionColors>()!
                                      .terminalUnfocusedAppBarTextColor,
                              radius: 6,
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: _onHover
                                  ? const Color(0xFFF4B52F)
                                  : Theme.of(context)
                                      .extension<ExtensionColors>()!
                                      .terminalUnfocusedAppBarTextColor,
                              radius: 6,
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: _onHover
                                  ? const Color(0xFF29BF40)
                                  : Theme.of(context)
                                      .extension<ExtensionColors>()!
                                      .terminalUnfocusedAppBarTextColor,
                              radius: 6,
                            ),
                            const SizedBox(width: 9),
                          ],
                        ),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                  _onHover
                                      ? 'images/folder_colored.png'
                                      : 'images/folder_disabled.png',
                                  width: 14,
                                  height: 14),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  S.of(context).myName,
                                  style: const TextStyle().copyWith(
                                      color: _onHover
                                          ? Theme.of(context)
                                              .extension<ExtensionColors>()!
                                              .terminalAppBarTextColor
                                          : Theme.of(context)
                                              .extension<ExtensionColors>()!
                                              .terminalUnfocusedAppBarTextColor),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 70),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0.5,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 6.0),
                      color: Theme.of(context)
                          .extension<ExtensionColors>()!
                          .terminalBackgroundColor,
                      child: SingleChildScrollView(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          layoutBuilder: (widget, widgets) {
                            if (widget != null) {
                              widgets = widgets.toList()..add(widget);
                            }
                            return Stack(
                              alignment: Alignment.topLeft,
                              children: widgets,
                            );
                          },
                          child: Text(
                            key: ValueKey<String>(
                                '$_consoleMessage${DateTime.now()}'),
                            _consoleMessage,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .extension<ExtensionColors>()!
                                        .terminalTextColor),
                            overflow: TextOverflow.fade,
                            maxLines: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
