import 'package:flutter/material.dart';

class HeroNavigationApp extends StatelessWidget {
  const HeroNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Navigation App',
      routes: {
        '/': (context) => const HomeScreen(),
        '/second': (context) => const DetailScreen(),
      },
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/second');
        },
        child: Hero(
          tag: 'imageHero',
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
        ),
      ),
    );
  }
}
