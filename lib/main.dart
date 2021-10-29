import 'package:flutter/material.dart';
import 'package:shop_app/screens/adminPanel.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/staggeredGridView.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sigma Menu',
      theme: ThemeData(
        // primaryColor: Colors.brown,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
        ).copyWith(),

        textTheme: Theme.of(context).textTheme.apply(
            // displayColor: Colors.brown,
            // decorationColor: Colors.brown,
            // bodyColor: Colors.brown
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/admin': (context) => AdminPanel(),
        '/dashboard': (context) => StaggerdGridView(),
      },
      home: HomeScreen(),
    );
  }
}
