import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roaa_weather/models.dart';


class DataService{
  Future<WeatherResponce> getWeather(String city) async{
//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  final queryParameters ={
    'q':city,
    'appid':'f5b80b338c7f08ed00f1e2c4bf43fb38',
     'units':'imperial',
  };


  final uri =Uri.https(
      'api.openweathermap.org','/data/2.5/weather',queryParameters);

  final response = await http.get(uri);
  print(response.body);
  final json=jsonDecode(response.body);
  return WeatherResponce.fromJson(json);
  }
}