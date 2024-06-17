// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(date) => "${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutMe": MessageLookupByLibrary.simpleMessage("About me"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of birth"),
        "developer": MessageLookupByLibrary.simpleMessage("DEVELOPER"),
        "language": MessageLookupByLibrary.simpleMessage("language"),
        "messageLevelOne": MessageLookupByLibrary.simpleMessage(
            "> Good day. Thank you for visiting my portfolio website. This portfolio has been designed and optimized for the desktop web environment. In order to provide you with the best user experience, please access from a desktop web browser. [Press]"),
        "messageLevelThree": MessageLookupByLibrary.simpleMessage(
            "> What would you like to know?"),
        "messageLevelTwo": MessageLookupByLibrary.simpleMessage(
            "> Hi I am developer Haeheum Jo. You can play music by clicking the music note icon below. You can adjust volume on top appbar. You can also edit language and theme mode. [Press]"),
        "messageMusicHover": MessageLookupByLibrary.simpleMessage(
            "> Let me introduce you my favorite singer!"),
        "messageOption1Hover": MessageLookupByLibrary.simpleMessage(
            "> Here, take my profile card."),
        "messageOption2Hover": MessageLookupByLibrary.simpleMessage(
            "> I have deep understanding of Flutter and various experiences. Let me introduce you to some beautiful views that i\'ve been interested in lately."),
        "messageOption3Hover": MessageLookupByLibrary.simpleMessage(
            "> I will show you my project experiences. Details will be on my resume."),
        "myBirthdate": m0,
        "myName": MessageLookupByLibrary.simpleMessage("HAEHEUM JO"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "option1": MessageLookupByLibrary.simpleMessage("Tell me about you"),
        "option2":
            MessageLookupByLibrary.simpleMessage("Show some flutter skills"),
        "option3": MessageLookupByLibrary.simpleMessage("Project experience?"),
        "projects": MessageLookupByLibrary.simpleMessage("Projects"),
        "skillSet": MessageLookupByLibrary.simpleMessage("Skill set")
      };
}
