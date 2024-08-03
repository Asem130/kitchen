import 'package:flutter/material.dart';
import 'package:kitchen/app/app.dart';
import 'package:kitchen/app/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAppModule();
  runApp(MyApp());
}
