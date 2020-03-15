import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
const apiKey = '0c90cc4ce053771a96d1f6f4094b20ce';
const mainUrl ='https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getLocationWeather()async{
    Location location = Location();
   await location.getCurrentLocation();
    NetworkCall networkCall = new NetworkCall('https://api.openweathermap.org/data/2.5/'
        'weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
   var weatherData = await networkCall.getData();
   return weatherData;
  }


  Future<dynamic> getCityWeather(String cityName)async{
    NetworkCall networkCall = new NetworkCall(
        'https://api.openweathermap.org/data/2.5/'
        'weather?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkCall.getData();
    return weatherData;
  }
}
