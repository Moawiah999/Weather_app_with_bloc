import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/views/home_view.dart';

import 'cubit/get_weather_cubit/get_weather_cubit.dart';
import 'cubit/get_weather_cubit/get_weather_state.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWestherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWestherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWestherCubit>(context)
                      .weatherModel
                      ?.weatherCondiion,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? conditions) {
  if (conditions == null) {
    return Colors.blue;
  }
  switch (conditions) {
    case 'Sunny':
      return Colors.amber;
    case 'Clear':
      return Colors.amber;
    case 'Partly cloudy':
      return Colors.blue;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
      return Colors.grey;
    case 'Patchy rain possible':
      return Colors.blue;
    case 'Patchy snow possible':
      return Colors.blueGrey;
    case 'Patchy sleet possible':
      return Colors.blueGrey;
    case 'Patchy freezing drizzle possible':
      return Colors.blueGrey;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;
    case 'Blowing snow':
      return Colors.blueGrey;
    case 'Blizzard':
      return Colors.blueGrey;
    case 'Fog':
      return Colors.grey;
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy light drizzle':
      return Colors.blue;
    case 'Light drizzle':
      return Colors.blue;
    case 'Freezing drizzle':
      return Colors.blueGrey;
    case 'Heavy freezing drizzle':
      return Colors.blueGrey;
    case 'Patchy light rain':
      return Colors.blue;
    case 'Light rain':
      return Colors.blue;
    case 'Moderate rain at times':
      return Colors.blue;
    case 'Moderate rain':
      return Colors.blue;
    case 'Heavy rain at times':
      return Colors.blue;
    case 'Heavy rain':
      return Colors.blue;
    case 'Light freezing rain':
      return Colors.blueGrey;
    case 'Moderate or heavy freezing rain':
      return Colors.blueGrey;
    case 'Light sleet':
      return Colors.blueGrey;
    case 'Moderate or heavy sleet':
      return Colors.blueGrey;
    case 'Patchy light snow':
      return Colors.blueGrey;
    case 'Light snow':
      return Colors.blueGrey;
    case 'Patchy moderate snow':
      return Colors.blueGrey;
    case 'Moderate snow':
      return Colors.blueGrey;
    case 'Patchy heavy snow':
      return Colors.blueGrey;
    case 'Heavy snow':
      return Colors.blueGrey;
    case 'Ice pellets':
      return Colors.blueGrey;
    case 'Light rain shower':
      return Colors.blue;
    case 'Moderate or heavy rain shower':
      return Colors.blue;
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Light sleet showers':
      return Colors.blueGrey;
    case 'Moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'Light snow showers':
      return Colors.blueGrey;
    case 'Moderate or heavy snow showers':
      return Colors.blueGrey;
    case 'Light showers of ice pellets':
      return Colors.blueGrey;
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    case 'Patchy light rain with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Patchy light snow with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
