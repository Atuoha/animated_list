import 'package:animated_list/stuffs/animated_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return const MaterialApp(
      home:HomeScreen(), // animated list
     // home: AnimatedIconsImpl(), // animatedIcon impl
    );
  }
}
