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
  static const String humidity = 'humidity';
  static const String wind = 'wind';
  static const String pressure = 'pressure';
  static const String visibility = 'visibility';
  static const String uvIndex = 'uv_index';
  static const String date = 'date';
  static const String feelsLike = 'feels_like';
  static const String errorLocation = 'error_location';
  static const String retry = 'retry';
  static const String noData = 'no_data';
  // English translations
  static const Map<String, dynamic> EN = {
    title: 'Weather Breez',
    body: 'Welcome to this app',
    recentSearches: 'Recent Searches',
    searchHint: 'Search for a city ',
    searchText: 'Search for a city to see the weather forecast',
    clear: 'Clear',
    humidity: 'Humidity',
    wind: 'Wind',
    pressure: 'Pressure',
    visibility: 'Visibility',
    uvIndex: 'UV Index',
    date: 'Date',
    feelsLike: 'Feels like',
    errorLocation:
        'Provided location may not be a popular city. Please try again.',
    retry: 'Retry',
    noData: 'No weather data available',
  };

  // Malayalam translations
  static const Map<String, dynamic> ML = {
    title: 'Weather Breez',
    body: 'ഈ ആപ്ലിക്കേഷനിലേക്ക് സ്വാഗതം',
    recentSearches: 'ഇതിനകമുള്ള തിരയലുകൾ',
    searchHint: 'ഒരു നഗരം തിരയുക',
    searchText: 'കാലാവസ്ഥാ പ്രവചനം കാണാൻ ഒരു നഗരം തിരയുക',
    clear: 'മായ്‌ക്കുക',
    humidity: 'ഈർപ്പം',
    wind: 'കാറ്റ്',
    pressure: 'മർദ്ദം',
    visibility: 'ദൃശ്യത',
    uvIndex: 'യുവി ഇൻഡക്സ്',
    date: 'തീയതി',
    feelsLike: 'അനുഭവപ്പെടുന്നത്',
    errorLocation:
        'നൽകിയ സ്ഥലം പ്രസിദ്ധമായിരിക്കില്ല. ദയവായി വീണ്ടും ശ്രമിക്കുക.',
    retry: 'വീണ്ടും ശ്രമിക്കുക',
    noData: 'ജലനിലവാരം ഡാറ്റ ലഭ്യമല്ല',
  };
}
