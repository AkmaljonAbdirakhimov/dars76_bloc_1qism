import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app.dart';
import 'services/services.dart';
import 'logic/cubits.dart';
import 'data/repositories/repositories.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (ctx) {
          return WeatherRepository(WeatherHttpService());
        }),
        RepositoryProvider(create: (ctx) {
          return TodoRepository(TodoHttpService());
        }),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) {
            return WeatherCubit(ctx.read<WeatherRepository>());
          }),
          BlocProvider(create: (ctx) {
            return TodoCubit(ctx.read<TodoRepository>());
          })
        ],
        child: const MainApp(),
      ),
    );
  }
}
