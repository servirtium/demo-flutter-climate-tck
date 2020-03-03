import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:servertium_flutter/average_rainfall_page.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(MaterialApp(home: AverageRainfallPage(url: 'http://localhost:8080')));
}
