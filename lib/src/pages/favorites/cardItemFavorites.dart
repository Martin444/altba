import 'package:flutter/material.dart';

class cardItemFavorites extends StatelessWidget {
  String precio = "0000";
  String modelo = "Modelo";
  String urlProducto = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtmn5upgGeBTKUvb2HsuMIIOVYe6G-xKTYj_IBUqGtq4UkXoixgw&s";
  cardItemFavorites(this.precio, this.modelo, this.urlProducto);
  @override
  Widget build(BuildContext context) {
    final fondoItem = Container(
      height: 120,
      width: MediaQuery.of(context).size.width * .95,
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        shape: BoxShape.rectangle,
      ),
    );
    final fotoProducto = Container(
      width: 110.0,
      height: 110.0,
      margin: EdgeInsets.only(left: 10.0, top: 15.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(urlProducto)),
      ),
    );
    final precioProducto = Container(
        margin: EdgeInsets.only(left: 130.0, top: 20.0),
        child: Text(
          "\$ $precio",
          style: TextStyle(
            fontSize: 24.0,
            color: Color.fromRGBO(210, 134, 25, 100),
          ),
        ));
    final nombreProducto = Container(
        margin: EdgeInsets.only(left: 130.0, top: 55.0),
        child: Text(
          "$modelo",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ));
    final botonAnadir = Container(
      margin: EdgeInsets.only(left:130.0, top: 80.0),
      child: OutlineButton.icon(
          onPressed: () {},
          shape: StadiumBorder(),
          icon: Icon(Icons.shopping_cart),
          label: Text("Añadir al carrito")),
    );

    return Stack(
      children: <Widget>[
        fondoItem,
        fotoProducto,
        precioProducto,
        nombreProducto,
        botonAnadir
      ],
    );
  }
}
