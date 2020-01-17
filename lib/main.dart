
import 'package:flutter/material.dart';
import 'package:altba/src/pages/login_page.dart';
import 'package:altba/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hola',
      initialRoute: 'login',
      routes: {
        'login' : ( BuildContext context ) => LoginPage(),
        'home' : ( BuildContext context ) => HomePage(),
      },
    );
  }

}
