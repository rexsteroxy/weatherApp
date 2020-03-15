import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '0c90cc4ce053771a96d1f6f4094b20ce';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void initState () {
    super.initState ();
    getLocationData ();
  }

  void getLocationData () async {
    Location location = new Location();
    await location.getCurrentLocation ();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkCall networkCall = new NetworkCall('https://api.openweathermap.org/data/2.5/'
        'weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var weatherData = await networkCall.getData();

    Navigator.push(context, PageTransition(type: PageTransitionType.fade,
        child: LocationScreen(locationWeather: weatherData)));
  }


  @override
  Widget build (BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child:SpinKitRotatingCircle(
              color: Colors.white,
              size: 100.0,
            ),
        ),
      ),
    );
  }
}
