import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/pages/home_page.dart';
import 'pages/initial_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'vacinandoedu',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
