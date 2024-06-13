import 'dart:async';
import 'dart:ui';

void kDebounce({
  required VoidCallback action,
  required Timer? debounceTimer,
  Duration duration = const Duration(milliseconds: 300),
}) {
  debounceTimer?.cancel();
  debounceTimer = Timer(duration, action);
}

Locale kGetLocaleFromLocaleInfo(String localeInfo) {
  List<String> parts = localeInfo.split('_');
  // parts[0] => languageCode, parts[1] => countryCode
  if (parts.length == 2) {
    return Locale(parts[0], parts[1]);
  } else {
    return Locale(parts[0]);
  }
}
