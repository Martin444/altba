import 'package:altba/src/pages/favorites/cardItemFavorites.dart';
import 'package:flutter/material.dart';

class listFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        children: <Widget>[
          cardItemFavorites(),
          cardItemFavorites(),
          cardItemFavorites(),
          cardItemFavorites(),
          cardItemFavorites()
        ],
      ),
    );
  }
}
