import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';





class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void initState () {
    super.initState ();
    getLocationData ();
  }

  void getLocationData () async {
    var weatherData = await WeatherModel().getLocationWeather();
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
