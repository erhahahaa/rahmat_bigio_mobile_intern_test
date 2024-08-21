import 'dart:ui';

class L10n {
  L10n._();

  static final supportedLocales = [
    const Locale('en', 'US'),
    const Locale('id', 'ID'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸';
      case 'id':
        return '🇮🇩';
      default:
        return '';
    }
  }

  static String getLocaleName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'id':
        return 'Indonesia';
      default:
        return '';
    }
  }

  static String getNameFlag(String code) {
    return '${getFlag(code)} ${getLocaleName(code)}';
  }
}
