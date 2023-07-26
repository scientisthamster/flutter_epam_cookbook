import 'package:flutter/material.dart';

import 'animation/fade_a_widget_in_and_out.dart' as fade_animation;
import 'codelab/first_flutter_app/first_flutter_app.dart' as first_app_codelab;

void main() {
  runApp(const first_app_codelab.MyApp());
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
