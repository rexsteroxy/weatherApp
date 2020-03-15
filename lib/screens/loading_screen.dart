import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as rex;
import 'dart:convert';

const apiKey = '0c90cc4ce053771a96d1f6f4094b20ce';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void initState() {
    super.initState();
    getLocation();

  }
  void getLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();
    latitude =  location.latitude;
    longitude =location.longitude;
    getData();
  }
  void getData() async {
    rex.Response response = await rex.get('https://api.openweathermap.org/data/2.5/'
        'weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    if(response.statusCode != 200){
      print(response.statusCode);
    }
    else{
      var data = response.body;
      var jd = jsonDecode(data);
      String cityName= jd['name'];
      double temperature = jd['main']['temp'];
      int condition = jd['weather'][0]['id'];
      print('Temperature from JSON: $temperature');
      print('CityName from JSON: $cityName');
      print('Condition from JSON: $condition');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
