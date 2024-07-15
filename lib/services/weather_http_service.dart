import 'dart:convert';

import 'package:dars76_bloc_1qism/core/utils/app_constants.dart';
import 'package:http/http.dart' as http;

import '../data/models/weather.dart';

class WeatherHttpService {
  Future<Weather?> getWeather(String city) async {
    Uri url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?units=metric&q=$city&appid=${AppConstants.weatherApiKey}",
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        return Weather(
          description: data['weather'][0]['main'],
          temperature: data['main']['temp'],
          city: city,
          icon: data['weather'][0]['icon'],
        );
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }
}
