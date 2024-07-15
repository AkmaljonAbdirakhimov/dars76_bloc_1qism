import 'package:dars76_bloc_1qism/logic/cubits/weather/weather_cubit.dart';
import 'package:dars76_bloc_1qism/logic/cubits/weather/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ob Havo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: "Shahar",
                suffixIcon: IconButton(
                  onPressed: () {
                    context
                        .read<WeatherCubit>()
                        .getWeather(cityController.text);
                  },
                  icon: const Icon(Icons.send),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: BlocConsumer<WeatherCubit, WeatherState>(
                  listener: (context, state) {
                    if (state is LoadingWeatherState) {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        },
                      );
                    }

                    if (state is LoadedWeatherState ||
                        state is ErrorWeatherState) {
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                  },
                  builder: (context, state) {
                    if (state is ErrorWeatherState) {
                      return Text(state.errorMessage);
                    }

                    if (state is LoadedWeatherState) {
                      return state.weather == null
                          ? const Text("Shahar topilmadi")
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.weather!.temperature.toStringAsFixed(0),
                                  style: const TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  state.weather!.city,
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://openweathermap.org/img/wn/${state.weather!.icon}@2x.png",
                                    ),
                                    Text(
                                      state.weather!.description,
                                      style: const TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                    }

                    return const Text("Shahar nomini kiriting");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
