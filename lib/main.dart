import 'package:flutter/material.dart';
import 'package:flutter_epam_cookbook/codelab/cupertino_app/app.dart';
import 'package:flutter_epam_cookbook/codelab/cupertino_app/model/app_state_model.dart';
import 'package:provider/provider.dart';

import 'animation/fade_a_widget_in_and_out.dart' as fade_animation;

void main() {
  runApp(ChangeNotifierProvider<AppStateModel>(
    create: (_) => AppStateModel()..loadProducts(),
    child: const CupertinoStoreApp(),
  ));
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
