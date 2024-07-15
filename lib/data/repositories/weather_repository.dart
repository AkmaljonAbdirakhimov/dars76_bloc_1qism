import 'package:dars76_bloc_1qism/data/models/weather.dart';
import 'package:dars76_bloc_1qism/services/weather_http_service.dart';

class WeatherRepository {
  final WeatherHttpService weatherHttpService;

  WeatherRepository(this.weatherHttpService);

  Future<Weather?> getWeather(String city) async {
    return weatherHttpService.getWeather(city);
  }
}
