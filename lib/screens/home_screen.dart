import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherforecasts/utilities/common_ui.dart';
import 'package:weatherforecasts/whether%20model/newmodel.dart';
import 'package:weatherforecasts/widgets/time.dart';
import 'package:weatherforecasts/widgets/weather_column.dart';
import 'package:weatherforecasts/widgets/weatheranimation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Weatherprovider>(context, listen: false).requestPermission("");
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    Stream<DateTime> clockStream = Stream<DateTime>.periodic(
        const Duration(seconds: 1), (count) => DateTime.now());

    dynamic getLottie(String condition) {
      if (condition == "loading..") {
        return "assets/splash.json";
      }
      switch (condition) {
        case 'Clouds':
          return "assets/cloudy.json";
        case 'Mist':
        case 'Smoke':
        case 'Haze':
        case 'Dust':
        case 'Fog':
          return "assets/snow.json";
        case 'Rain':
        case 'Drizzle':
        case 'Shower rain':
          return "assets/rain.json";
        case 'Thunderstorm':
          return "assets/thunderstorm.json";
        case 'Clear':
          return "assets/sunny.json";
        default:
          return "assets/splash.json";
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white.withOpacity(0.5),
                          content: SizedBox(
                            height: 140,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  controller: controller,
                                  decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "city name",
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          // Navigator.of(context).pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomeScreen()));
                                          Provider.of<Weatherprovider>(context,
                                                  listen: false)
                                              .requestPermission(
                                                  controller.text.trim());
                                        },
                                        child: const Text("search")),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Cancel"))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 116, 124, 192),
                  size: 30,
                ))
          ],
        ),
      ),
      body: BackGround(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<Weatherprovider>(
          builder:
              (BuildContext context, Weatherprovider value, Widget? child) {
            if (value.ob.weatherType == "loading..") {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.place,
                        size: 40,
                        color: Color.fromARGB(255, 249, 228, 67),
                      ),
                      Text(
                        value.ob.city,
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                  Time(clockStream: clockStream),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.8,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            '${value.ob.temperature.ceil()}°',
                            style: const TextStyle(
                              fontSize: 170,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 230,
                            left: 67,
                            child: Text(
                              value.ob.weatherType.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            )),
                        Positioned(
                          top: 150,
                          right: 32,
                          child: SizedBox(
                              height: 150,
                              width: 150,
                              child: WeatherAnimation(
                                  animation: getLottie(value.ob.weatherType))),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherColumn(
                            weathername: "Temperature",
                            weatherData: '${value.ob.temperature.ceil()}°',
                            weatherIcon: Icons.thermostat),
                        WeatherColumn(
                            weathername: "Wind",
                            weatherData: value.ob.wind.toString(),
                            weatherIcon: Icons.wind_power),
                        WeatherColumn(
                            weathername: "Sea Level",
                            weatherData: value.ob.sealevel.toString(),
                            weatherIcon: Icons.waves_sharp),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherColumn(
                            weathername: "Humidity",
                            weatherData: value.ob.humidity.toString(),
                            weatherIcon: Icons.water_drop),
                        WeatherColumn(
                            weathername: "Min temp",
                            weatherData: '${value.ob.temperaturemin.ceil()}°',
                            weatherIcon: Icons.thermostat),
                        WeatherColumn(
                            weathername: "Max temp",
                            weatherData: '${value.ob.temperatuemax.ceil()}°',
                            weatherIcon: Icons.thermostat),
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      )),
    );
  }
}
