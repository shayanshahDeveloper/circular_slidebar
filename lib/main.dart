import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Slidebar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CircularSlideBar(),
    );
  }
}

class CircularSlideBar extends StatefulWidget {
  @override
  _CircularSlideBarState createState() => _CircularSlideBarState();
}

class _CircularSlideBarState extends State<CircularSlideBar> {
  double _currentTemperature = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Sidebar Temperature'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Temperature',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: _currentTemperature / 100,
                    strokeWidth: 12,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                Text(
                  '${_currentTemperature.toStringAsFixed(1)}°C',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 40),
            Slider(
              value: _currentTemperature,
              min: -10,
              max: 50,
              divisions: 600,
              label: _currentTemperature.toStringAsFixed(1),
              onChanged: (double value) {
                setState(() {
                  _currentTemperature = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
