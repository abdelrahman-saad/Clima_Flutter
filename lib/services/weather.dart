import 'package:clima/services/location.dart';
import '../services/location.dart';
import 'package:clima/services/networking.dart';

import '../services/networking.dart';

const apiKey = '0998495b0a239b047d4d397dcab7be31';
const WatherAPI = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentPosition();
    NetworkHelper NH = NetworkHelper(
        url:
            '$WatherAPI?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var weatherData = await NH.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String city) async {
    NetworkHelper NH =
        NetworkHelper(url: '$WatherAPI?q=$city&appid=$apiKey&units=metric');
    var weatherData = await NH.getData();
    return weatherData;
  }

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
}
