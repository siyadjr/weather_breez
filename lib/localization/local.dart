import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale('en', Localdata.EN),
  MapLocale('ml', Localdata.ML),
];

// Since we're using keys directly with FlutterLocalization.translate(),
// we don't need any helper methods
class Localdata {
  // Key names
  static const String title = 'title';
  static const String body = 'body';
  static const String recentSearches = 'recent_searches';
  static const String searchHint = 'search_hint';
  static const String searchText = 'search_text';
  static const String clear = 'clear';

  // English translations
  static const Map<String, dynamic> EN = {
    title: 'WeatherBreez',
    body: 'Welcome to this app',
    recentSearches: 'Recent Searches',
    searchHint: 'Search for a city ',
    searchText: 'Search for a city to see the weather forecast',
    clear: 'Clear',
  };

  // Malayalam translations
  static const Map<String, dynamic> ML = {
    title: 'Weather Breez',
    body: 'ഈ ആപ്ലിക്കേഷനിലേക്ക് സ്വാഗതം',
    recentSearches: 'ഇതിനകമുള്ള തിരയലുകൾ',
    searchHint: 'ഒരു നഗരം തിരയുക',
    searchText: 'കാലാവസ്ഥാ പ്രവചനം കാണാൻ ഒരു നഗരം തിരയുക',
    clear: 'മായ്‌ക്കുക',
  };
}
