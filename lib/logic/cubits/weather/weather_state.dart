// sealed - bu abstract class va faqatgina shu faylda ishlaydi
import 'package:dars76_bloc_1qism/data/models/weather.dart';

sealed class WeatherState {}

// final - bundan faqat obyekt yaratib ishlatish mumkin, nasil olish mumkin emas
// boshlang'ich holat
final class InitialWeatherState extends WeatherState {}

// yuklanmoqda holati
final class LoadingWeatherState extends WeatherState {}

// yuklanib bo'lgan holati
final class LoadedWeatherState extends WeatherState {
  final Weather? weather;

  LoadedWeatherState(this.weather);
}
// xatolik holati

final class ErrorWeatherState extends WeatherState {
  final String errorMessage;

  ErrorWeatherState(this.errorMessage);
}
