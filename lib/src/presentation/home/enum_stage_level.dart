enum StageLevel {
  justEntered(level: 0, clickable: true),
  gavePrecautions(level: 1,clickable: true),
  heroArrives(level: 2,clickable: true),
  introduceMyself(level: 3, clickable: false);


  const StageLevel({required this.level, required this.clickable});

  final int level;
  final bool clickable;

}