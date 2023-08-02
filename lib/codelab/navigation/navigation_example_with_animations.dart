import 'package:flutter/material.dart';

class NavigatorExampleWithAnimations extends StatelessWidget {
  const NavigatorExampleWithAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigatorExample3',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstRoute(),
        '/second': (context) => const SecondRoute(),
      },
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                /// Use standard material page navigation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondRoute(),
                  ),
                );

                /// Use standard name route navigation
                // Navigator.pushNamed(context, '/second');

                /// Use cupertino navigation animation
                // Navigator.push(
                //   context,
                //   CupertinoPageRoute(
                //     builder: (context) => const SecondRoute(),
                //   ),
                // );
              },
              child: const Text('Standard material navigation'),
            ),
            ElevatedButton(
              onPressed: () {
                /// Custom navigation with sliding animation
                Navigator.push(
                  context,
                  SlideRightRoute(
                    page: const SecondRoute(),
                  ),
                );
              },
              child: const Text('Slide Right Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                /// Custom navigation with scale animation
                Navigator.push(
                  context,
                  ScaleRoute(
                    page: const SecondRoute(),
                  ),
                );
              },
              child: const Text('Scale Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                /// Custom navigation with rotation animation
                Navigator.push(
                  context,
                  RotationRoute(
                    page: const SecondRoute(),
                  ),
                );
              },
              child: const Text('Rotation Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                /// Custom navigation with size animation
                Navigator.push(
                  context,
                  SizeRoute(
                    page: const SecondRoute(),
                  ),
                );
              },
              child: const Text('Size Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                /// Custom navigation with fade animation
                Navigator.push(
                  context,
                  FadeRoute(
                    page: const SecondRoute(),
                  ),
                );
              },
              child: const Text('Fade Transition'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Container(
        color: Colors.deepOrangeAccent,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );

  final Widget page;
}

class ScaleRoute extends PageRouteBuilder {
  ScaleRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
            ),
            child: child,
          ),
        );

  final Widget page;
}

class RotationRoute extends PageRouteBuilder {
  RotationRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              RotationTransition(
            turns: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
            child: child,
          ),
        );

  final Widget page;
}

class SizeRoute extends PageRouteBuilder {
  SizeRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              Align(
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
          ),
        );

  final Widget page;
}

class FadeRoute extends PageRouteBuilder {
  FadeRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );

  final Widget page;
}
