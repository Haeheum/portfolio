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
        "aboutMeMessage": MessageLookupByLibrary.simpleMessage("About me"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of birth"),
        "developer": MessageLookupByLibrary.simpleMessage("DEVELOPER"),
        "language": MessageLookupByLibrary.simpleMessage("language"),
        "musicTooltip": MessageLookupByLibrary.simpleMessage("My playlist"),
        "myBirthdate": m0,
        "myMessage": MessageLookupByLibrary.simpleMessage(
            "Warning) This portfolio is created for the desktop web environment. It is responsive supporting various screen sizes, but it is not adaptive thus will not function properly in mobile web environment."),
        "myName": MessageLookupByLibrary.simpleMessage("HAEHEUM JO"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "projects": MessageLookupByLibrary.simpleMessage("Projects"),
        "projectsMessage":
            MessageLookupByLibrary.simpleMessage("Project experiences"),
        "skillSet": MessageLookupByLibrary.simpleMessage("Skill set"),
        "skillSetMessage": MessageLookupByLibrary.simpleMessage("Skill set")
      };
}
