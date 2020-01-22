import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final carouselProducto = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*.40,
      color:Colors.red,
    );
    final descripcionProducto = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.20,
      color:Colors.blue,
    );
    final propiedadesProducto = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*.15,
      color:Colors.green,
    );
    final accionesProducto = Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.15,
      color:Colors.orange,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Producto'),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                carouselProducto,
                descripcionProducto,
                propiedadesProducto,
              ],
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: accionesProducto,
            )
          ],
        )
    );
  }
}