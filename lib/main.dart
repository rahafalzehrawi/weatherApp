import 'package:flutter/material.dart';
import 'package:roaa_weather/models.dart';

import 'data_serves.dart';
import 'home.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {

  @override
  _MyApp createState() =>_MyApp();
}
class _MyApp extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
   WeatherResponce? _responce;
 //=WeatherResponce(cityName: '', tempInfo:null, weatherInfo: null,);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_responce != null)
                Column(
                  children: [
                    Image.network(_responce?.iconUrl??""),
                    Text('${_responce?.tempInfo.temprerature}',
                    style: TextStyle(fontSize: 40),
                    ),
                    Text(_responce?.weatherInfo?.description??""),
                  ],
                ),
              Padding(padding: EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(width: 150,
              child: TextField(
                controller: _cityTextController,
                decoration: InputDecoration(labelText: 'city'),
                textAlign: TextAlign.center,
              )),
              ),
              ElevatedButton(onPressed: _search, child: Text('Search'))
            ],
          ),
        ),
      ),
    );

  }
  void _search() async{
 final response= await _dataService.getWeather(_cityTextController.text);
 setState(() => _responce=response);
  }
}

