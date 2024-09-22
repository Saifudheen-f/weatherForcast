import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Weatherprovider extends ChangeNotifier {
  late Position _currentPosition;
  WeatherData ob = WeatherData(
      city: "loading..",
      temperature: 0.00,
      temperaturemin: 0.00,
      weatherType: "loading..",
      wind: 0.00,
      sealevel: 0.00,
      humidity: 0.00,
      temperatuemax: 0.00,
      feelslike: 0.00);

  Position get currentPosition => _currentPosition;

  void requestPermission(String cityname) async {
    LocationPermission permission = await Geolocator.requestPermission();
    // ignore: avoid_print
    print(permission);
    getCurrentLocation(cityname);
  }

  Future<void> getCurrentLocation(String cityname) async {
    _currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    await fetchdata(cityname);
  }

  Future<void> fetchdata(String cityname) async {
    String url = "";

    if (cityname == "") {
      url =
          "https://api.openweathermap.org/data/2.5/weather?lat=${_currentPosition.latitude}&lon=${_currentPosition.longitude}&appid=cd6516b46fed84bc7975eeef43d2604d";
    } else {
      url =
          "https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=cd6516b46fed84bc7975eeef43d2604d";
    }
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      ob = WeatherData(
          city: data['name'],
          temperature: (data["main"]["temp"] - 273.15),
          temperaturemin: (data["main"]["temp_min"] - 273.15),
          weatherType: data["weather"][0]["main"],
          wind: data["wind"]["speed"],
          sealevel: data["main"]["sea_level"],
          humidity: data["main"]["humidity"],
          temperatuemax: (data["main"]["temp_max"] - 273.15),
          feelslike: data["main"]["feels_like"],
          weatherTypeDescribe: data["weather"][0]["description"]);
      notifyListeners();
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  dynamic getLottie(String condition) {
    if (condition == "loading..") {
      return "assets/splash.json";
    }
    switch (condition) {
      case 'clouds':
        return "assets/cloud.json";
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return "assets/snow.json";
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return "assets/rain.json";
      case 'thunderstorm':
        return "assets/thunderstorm.json";
      case 'clear':
        return "assets/sunny.json";
      default:
        return "assets/splash.json";
    }
  }
}

class WeatherData {
  final dynamic temperature;
  final dynamic temperaturemin;
  final dynamic weatherType;
  final dynamic weatherTypeDescribe;
  final dynamic wind;
  final dynamic humidity;
  final dynamic temperatuemax;
  final dynamic feelslike;
  final dynamic sealevel;
  final dynamic city;

  WeatherData({
    this.weatherTypeDescribe,
    required this.city,
    required this.temperature,
    required this.temperaturemin,
    required this.weatherType,
    required this.wind,
    required this.sealevel,
    required this.humidity,
    required this.temperatuemax,
    required this.feelslike,
  });
}
