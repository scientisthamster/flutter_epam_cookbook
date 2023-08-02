import 'package:flutter/material.dart';
import 'package:flutter_epam_cookbook/codelab/navigation/navigation_return_data_from_screen.dart';

import 'animation/fade_a_widget_in_and_out.dart' as fade_animation;

void main() {
  runApp(const ReturningDataApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const fade_animation.MyHomePage(title: 'Opacity Demo'),
    );
  }
}
