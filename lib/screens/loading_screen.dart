import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as rex;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();
    print('hello: ${location.latitude}');
    print(location.longitude);
  }

  void getData() async {
    rex.Response response = await rex.get('http://samples.openweathermap.org/data/2.5/'
        'weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
if(response.statusCode != 200){
  print(response.statusCode);
}else{
  var data = response.body;
//  var longitude = jsonDecode(data)['coord']['lon'];
//  var latitude = jsonDecode(data)['coord']['lat'];
//  var description = jsonDecode(data)['weather'][0]['description'];
//  var humidity = jsonDecode(data)['main']['humidity'];
  var jd = jsonDecode(data);
  String cityName= jd['name'];
  double temperature = jd['main']['temp'];
  int condition = jd['weather'][0]['id'];
//  print('Longitude from JSON: $longitude');
//  print('Latitude from JSON: $latitude');
  print('Description from JSON: $temperature');
  print('CityName from JSON: $cityName');
  print('Humidiy from JSON: $condition');
}

  }

  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
