import 'package:flutter/material.dart';

class cardItemFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 120,
      width: MediaQuery.of(context).size.width * .95,
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        shape: BoxShape.rectangle,
      ),
    );
    final photo = Container(
      width: 110.0,
      height: 110.0,
      margin: EdgeInsets.only(left: 10.0,top: 15.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/altba-e47fe.appspot.com/o/Categorias%2FAlhajeros%2FAlhajero%201%2FAlhajero1.jpg?alt=media&token=39a48cf5-d86f-43d2-82dd-132b59ff6aa5")),
      ),
    );
    return Stack(
      children: <Widget>[card, photo],
    );
  }
}
