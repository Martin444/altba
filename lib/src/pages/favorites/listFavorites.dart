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
          cardItemFavorites("4,300","Alhajero Roma","https://firebasestorage.googleapis.com/v0/b/altba-e47fe.appspot.com/o/Categorias%2FAlhajeros%2FAlhajero%201%2FAlhajero1.jpg?alt=media&token=39a48cf5-d86f-43d2-82dd-132b59ff6aa5"),
          cardItemFavorites("2,900","Escritorio Desayunador","https://firebasestorage.googleapis.com/v0/b/altba-e47fe.appspot.com/o/Categorias%2FMesas%2FEscritorioDesayunador%2FEscritorio-Desayunador.jpg?alt=media&token=71ca2b01-089d-4214-827f-da57ad4563e2"),
          cardItemFavorites("2,500", "Closet Estocolmo","https://firebasestorage.googleapis.com/v0/b/altba-e47fe.appspot.com/o/Categorias%2FClosets%2FClosetEstocolmo%2FCloset-Estocolmo.jpg?alt=media&token=e174166a-d533-491d-995a-69b2e64f463d"),
          cardItemFavorites("4,500", "Comoda Love","https://firebasestorage.googleapis.com/v0/b/altba-e47fe.appspot.com/o/Categorias%2FComodas%2FComodaLove%2FComoda-Love.jpg?alt=media&token=5ba9ef04-6978-45a8-946e-88a9be1f7ec5"),
          cardItemFavorites("3,900", "Ropero Oslo","https://firebasestorage.googleapis.com/v0/b/altba-e47fe.appspot.com/o/Categorias%2FRoperos%2FRoperoOslo%2FRopero-Oslo.jpg?alt=media&token=73961653-fb6a-4acb-a3ef-0d27725c1e27")
        ],
      ),
    );
  }
}
