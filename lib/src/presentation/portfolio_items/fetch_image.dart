import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../data/image_repository.dart';

class FetchImage extends StatefulWidget {
  const FetchImage({super.key});

  @override
  State<FetchImage> createState() => _FetchImageState();
}

class _FetchImageState extends State<FetchImage> {
  bool _willSucceed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: FutureBuilder(
              future: _loadImage(willSucceed: _willSucceed),
              builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
                return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: switch (snapshot.connectionState) {
                      ConnectionState.none ||
                      ConnectionState.waiting =>
                        const CircularProgressIndicator(),
                      ConnectionState.active ||
                      ConnectionState.done when snapshot.hasData =>
                        Center(
                          key: ValueKey<String>(DateTime.now.toString()),
                          child: snapshot.data,
                        ),
                      ConnectionState.active || ConnectionState.done => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/bee_sad.webp'),
                            Text(S.of(context).fetchImageErrorText),
                          ],
                        ),
                    });
              },
            ),
          ),
        ),
        const SizedBox(width: 4),
        StatefulBuilder(builder: (context, setState) {
          return Switch(
              value: _willSucceed,
              onChanged: (willSucceed) {
                setState(() {
                  _willSucceed = willSucceed;
                });
              });
        }),
        const SizedBox(width: 4),
        TextButton(
          onPressed: () {
            setState(() {});
          },
          child: Text(S.of(context).fetchImage),
        )
      ],
    );
  }

  Future<Image> _loadImage({required bool willSucceed}) async {
    return await ImageRepository().fetchImage(willSucceed: _willSucceed);
  }
}
