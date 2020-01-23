import 'package:altba/src/pages/favorites/listFavorites.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Altba Inicio'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon( Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          listFavorites()
        ],
      ),
    );
  }
}
