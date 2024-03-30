import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/models/weather_models.dart';
import 'package:weatherapp/services/weather_services.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search View'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value) async {
              BlocProvider.of<GetWestherCubit>(context)
                  .getWeather(cityName: value);

              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
