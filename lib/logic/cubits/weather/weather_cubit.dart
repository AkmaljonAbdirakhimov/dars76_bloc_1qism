import 'package:dars76_bloc_1qism/logic/cubits/weather/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepository) : super(InitialWeatherState());

  final WeatherRepository weatherRepository;

  void getWeather(String city) async {
    emit(LoadingWeatherState());
    try {
      final weather = await weatherRepository.getWeather(city);
      emit(LoadedWeatherState(weather));
    } catch (e) {
      emit(ErrorWeatherState(e.toString()));
    }
  }
}
