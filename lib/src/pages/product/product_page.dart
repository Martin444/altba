import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductPage extends StatelessWidget{

  String nombreProducto = "Nombre";
  String altoProducto = "0.0 cm";
  String anchoProducto = "0.0 cm";
  String fondoProducto = "0.0 cm";

  final List<String> imgList = [
    'https://firebasestorage.googleapis.com/v0/b/altba-e47fe.appspot.com/o/Categorias%2FRoperos%2FRoperoBosnia%2FRopero-Bosnia(1).jpg?alt=media&token=c7ac6618-d923-4daa-ba0d-a4f9930d6fc3',
    'https://firebasestorage.googleapis.com/v0/b/altba-e47fe.appspot.com/o/Categorias%2FRoperos%2FRoperoBosnia%2FRopero-Bosnia.jpg?alt=media&token=ec4334fa-2355-4620-a94b-ae0d5bcd8422',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final CarouselSlider coverScreenExample = CarouselSlider(
      viewportFraction: 1.0,
      aspectRatio: 1.0,
      autoPlay: false,
      enlargeCenterPage: false,
      items: map<Widget>(
        imgList,
            (index, i) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(i), fit: BoxFit.contain),
            ),
          );
        },
      ),
    );
    final carouselProducto = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*.40,
      child: coverScreenExample
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
