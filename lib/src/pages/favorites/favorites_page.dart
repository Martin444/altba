import 'package:altba/src/pages/favorites/listFavorites.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: Stack(
        children: <Widget>[
          listFavorites()
        ],
      ),
    );
  }
}
