import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather_models.dart';
import '../../services/weather_services.dart';

import 'get_weather_state.dart';

class GetWestherCubit extends Cubit<WeatherState> {
  GetWestherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          (await WeatherServices(Dio()).getCurretWether(cityName: cityName))!;
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
