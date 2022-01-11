/*



 */
import 'package:roaa_weather/home.dart';

class WeatherInfo{
  final String description;
  final String icon;
  WeatherInfo({required this.description,required this.icon});
  factory WeatherInfo.fromJson(Map<String,dynamic>json){
    final description=json['description'];
    final icon=json['icon'];
    return WeatherInfo(description:description,icon:icon);
  }


}
class TemperatureInfo{
  final double temprerature;
  TemperatureInfo({required this.temprerature});
  factory TemperatureInfo.fromJson(Map<String,dynamic>json){
    final temprerature = json['temp'];
    return TemperatureInfo(temprerature: temprerature);
  }
}
class WeatherResponce{
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl{
    return  'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponce({ required this.cityName,required this.tempInfo,required this.weatherInfo});
  factory WeatherResponce.fromJson(Map<String,dynamic>json){
    final cityName=json['name'];

    final tempInfoJson=json['main'];
    final tempInfo=TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson=json['weather'][0];
    final weatherInfo =WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponce(
        cityName: cityName,tempInfo: tempInfo,weatherInfo: weatherInfo);
  }
}