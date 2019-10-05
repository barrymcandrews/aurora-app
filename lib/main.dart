import 'package:aurora_flutter/screens/home/homescreen.dart';
import 'package:aurora_flutter/screens/settings/settingsscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.green,
//				backgroundColor: Colors.white,
//      ),

			initialRoute: '/',
			routes: <String, WidgetBuilder>{
				"/": (BuildContext context) => HomeScreen(),
				"/SettingsScreen": (BuildContext context) => SettingsScreen(),
			},
    );
  }
}


