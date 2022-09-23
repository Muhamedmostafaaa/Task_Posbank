import 'package:flutter/material.dart';
import 'package:task_posbank/app/app.dart';
import 'package:task_posbank/core/services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const MyApp());
}
