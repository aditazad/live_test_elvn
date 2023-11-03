import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatelessWidget {
  final String jsonData = '''
  [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    List<dynamic> weatherData = json.decode(jsonData);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      backgroundColor: Colors.grey[200], // Set the background color to light grey
      body: ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> data = weatherData[index];
          return Padding(
            padding: EdgeInsets.all(8), // Adjusted the padding here
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(12), // Adjusted the padding here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'City: ${data['city']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4), // Reduced the gap here
                    Text(
                      'Temperature: ${data['temperature']} °C',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Condition: ${data['condition']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Humidity: ${data['humidity']}%',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Wind Speed: ${data['windSpeed']} m/s',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
