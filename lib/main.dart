import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_weather/constants.dart';
import 'package:online_weather/model/current_city_data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var titleString = ['wind speed', 'sunrise', 'sunset', 'humidity'];
  var subTitleString = ['4.73 m/s', '6:19 PM', '9:20 AM', '72%'];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendRequestWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal.shade900,
          title: Text('Online Weather BS'),
          actions: [
            PopupMenuButton<String>(
              itemBuilder: (context) {
                return {'item 1 new', 'item 2'}.map((String choice) {
                  return PopupMenuItem(
                    child: Text(choice),
                    value: choice,
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              label: Text('search your city'),
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          backgroundColor: Colors.green.shade900,
                        ),
                        onPressed: () {},
                        child: Text('find'.toUpperCase()),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Mountain view',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Clear sky',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 15),
                Icon(
                  Icons.light_mode_outlined,
                  color: Colors.white,
                  size: 80,
                ),
                SizedBox(height: 15),
                Text(
                  '14' + '\u00B0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'min',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          '12' + '\u00b0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.white,
                      width: 2,
                      height: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'max',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          '18' + '\u00b0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  height: 2,
                  color: Colors.grey,
                ),
                // List view section
                Container(
                  width: double.infinity,
                  height: 120,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              'Fri 8pm',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            Icon(
                              Icons.light_mode_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '18' + '\u00b0',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5,
                  ),
                  height: 2,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Column(
                          children: [
                            Text(
                              titleString[i],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              subTitleString[i],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendRequestWeather() async {
    var cityName = 'tehran';
    var response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          "q": cityName,
          "appid": apiKey,
          'units': 'metric',
        });
    CurrentCityDataModel(
      response.data['name'],
      response.data['weather'][0]['main'],
      response.data['weather'][0]['description'],
      response.data['sys']['country'],
      response.data['coord']['lon'],
      response.data['coord']['lat'],
      response.data['main']['temp'],
      response.data['main']['temp_min'],
      response.data['main']['temp_max'],
      response.data['wind']['speed'],
      response.data['main']['pressure'],
      response.data['main']['humidity'],
      response.data['sys']['sunrise'],
      response.data['sys']['sunset'],
      response.data['dt'],
    );
  }
}
