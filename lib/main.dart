import 'package:flutter/material.dart';
import 'package:flutter_web_performance/screens/description_page.dart';
import 'package:flutter_web_performance/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Performance Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        final arguments = settings.arguments;
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(
              builder: (context) => HomePage(),
            );
            break;
          case '/description':
            return MaterialPageRoute(
              builder: (context) => DescriptionPage(arguments),
            );
            break;
          default:
            return MaterialPageRoute(
              builder: (context) => HomePage(),
            );
            break;
        }
      },
    );
  }
}
