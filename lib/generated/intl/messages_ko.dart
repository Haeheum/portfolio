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
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("생일"),
        "developer": MessageLookupByLibrary.simpleMessage("개발자"),
        "language": MessageLookupByLibrary.simpleMessage("언어"),
        "milestoneTooltip": MessageLookupByLibrary.simpleMessage("내 여정표 보기"),
        "musicTooltip":
            MessageLookupByLibrary.simpleMessage("내가 좋아하는 가수 노래 듣기"),
        "myBirthdate": m0,
        "myName": MessageLookupByLibrary.simpleMessage("조해흠"),
        "name": MessageLookupByLibrary.simpleMessage("이름"),
        "projectsTooltip": MessageLookupByLibrary.simpleMessage("내 프로젝트 보기"),
        "strengthTooltip": MessageLookupByLibrary.simpleMessage("내 강점 보기")
      };
}
