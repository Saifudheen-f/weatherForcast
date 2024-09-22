import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherColumn extends StatelessWidget {
  const WeatherColumn({super.key,  required this.weathername, required this.weatherData,required this.weatherIcon});
  final String weatherData;
  final String weathername;
  final IconData weatherIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
           Icon(weatherIcon,color: const Color.fromARGB(255, 20, 6, 63).withOpacity(0.5),),
          Text(
            weatherData,style: const TextStyle(color:Color.fromARGB(255, 106, 53, 231),fontWeight: FontWeight.bold),
          ),
           Text(weathername,style:  TextStyle(color: const Color.fromARGB(255, 20, 6, 63).withOpacity(0.5)),)
        ],
      ),
    );
  }
}
