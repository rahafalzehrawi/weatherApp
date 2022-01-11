import 'package:flutter/material.dart';
import 'package:http/http.dart';
class weather extends StatefulWidget {

  @override
  _weatherState createState() => _weatherState();
}

class _weatherState extends State<weather> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a search term',
          ),
        ),
      ],),
    );
  }
}
