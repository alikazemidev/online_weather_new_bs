import 'dart:ui';

import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: SizedBox(
                      height: 45,
                      child: TextField(
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
      ),
    );
  }
}
