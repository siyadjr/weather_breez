import 'package:flutter/cupertino.dart';
import 'package:weatherbreez/core/api/weather_api.dart';
import 'package:weatherbreez/model/weather_model.dart';
// Import your weather model

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  bool _isLoading = false;
  String? _error;

  // Getters
  WeatherModel? get weatherData => _weatherData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Method to fetch weather data
  Future<void> fetchWeatherData(String city) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final data = await WeatherApi().getWeather(city);
      _weatherData = WeatherModel.fromJson(data);

      _isLoading = false;

      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }
}
