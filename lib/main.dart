import 'package:flutter/material.dart';

import 'package:altba/src/bloc/provider.dart';
import 'package:altba/src/pages/favorites/favorites_page.dart';
import 'package:altba/src/pages/login_page.dart';
import 'package:altba/src/pages/home_page.dart';
import 'package:altba/src/preferencias_usuario/preferencias_usuario.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final prefs = new PreferenciasUsuario();
    print( prefs.token );

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Altba',
        initialRoute: 'favorite',
        routes: {
          'favorite' : ( BuildContext context ) => FavoritesPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.black
        ),
      ), 
    );
  }
}
