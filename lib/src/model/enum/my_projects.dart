enum MyProjectsKorean {
  unlock(projectName: '언락', projectDescription: '언락설명', url: 'a'),
  susuda(projectName: 'susuda', projectDescription: 'ㄴ', url: 'ㅁㄴㅇ');

  const MyProjectsKorean(
      { required this.projectName, required this.projectDescription, this.url});

  final String projectName;
  final String projectDescription;
  final String? url;
}

enum MyProjectsEnglish {
  unlock(projectName: 'unlock', projectDescription: 'description', url: 'a'),
  susuda(projectName: 'susuda', projectDescription: 'description', url: 'ㅁㄴㅇ');

  const MyProjectsEnglish(
      { required this.projectName, required this.projectDescription, this.url});

  final String projectName;
  final String projectDescription;
  final String? url;
}