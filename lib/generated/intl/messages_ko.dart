// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  static String m0(date) => "${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutMe": MessageLookupByLibrary.simpleMessage("내정보"),
        "aboutMeMessage": MessageLookupByLibrary.simpleMessage("내 정보 보기"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("생일"),
        "developer": MessageLookupByLibrary.simpleMessage("개발자"),
        "language": MessageLookupByLibrary.simpleMessage("언어"),
        "musicTooltip":
            MessageLookupByLibrary.simpleMessage("내가 좋아하는 가수 노래 듣기"),
        "myBirthdate": m0,
        "myMessage": MessageLookupByLibrary.simpleMessage(
            "주의) 이 포트폴리오는 데스크탑 웹 환경을 대상으로 제작되었습니다. 이 웹앱은 반응형으로 다양한 화면 크기를 지원하지만 모바일 웹 환경에 대응한 적응형 앱은 아닙니다."),
        "myName": MessageLookupByLibrary.simpleMessage("조해흠"),
        "name": MessageLookupByLibrary.simpleMessage("이름"),
        "projects": MessageLookupByLibrary.simpleMessage("프로젝트"),
        "projectsMessage": MessageLookupByLibrary.simpleMessage("프로젝트 경험 보기"),
        "skillSet": MessageLookupByLibrary.simpleMessage("스킬셋"),
        "skillSetMessage": MessageLookupByLibrary.simpleMessage("스킬셋 보기")
      };
}
