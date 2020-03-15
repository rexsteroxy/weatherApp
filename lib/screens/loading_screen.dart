import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as rex;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    rex.Response response = await rex.get('http://samples.openweathermap.org/data/2.5/'
        'weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
if(response.statusCode != 200){
  print(response.statusCode);
}else{}
    print(response.body);
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
