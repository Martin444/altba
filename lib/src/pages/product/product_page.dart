import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductPage extends StatelessWidget {
  String nombreProducto = "Modular Europeo";
  String altoProducto = "190.0 cm";
  String anchoProducto = "240.0 cm";
  String fondoProducto = "55.0 cm";
  String precioProducto = "\$99,000";
  String dropdownValue = 'One';
  final List<String> imgList = [
    'https://firebasestorage.googleapis.com/v0/b/altba-e47fe.appspot.com/o/Categorias%2FRoperos%2FRoperoBosnia%2FRopero-Bosnia(1).jpg?alt=media&token=c7ac6618-d923-4daa-ba0d-a4f9930d6fc3',
    'https://firebasestorage.googleapis.com/v0/b/altba-e47fe.appspot.com/o/Categorias%2FRoperos%2FRoperoBosnia%2FRopero-Bosnia.jpg?alt=media&token=ec4334fa-2355-4620-a94b-ae0d5bcd8422',
  ];
  final List _colores = ["Rojo", "Negro", "Cafe"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // ****************** WIDGETS *****************
    //CARRUSEL
    final CarouselSlider coverScreenExample = CarouselSlider(
      viewportFraction: 0.9,
      aspectRatio: 1.5,
      autoPlay: false,
      enlargeCenterPage: true,
      pauseAutoPlayOnTouch: Duration(seconds: 3),
      items: imgList.map(
        (url) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.fill,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    );
    //DETALLES
    final modeloProducto = Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      alignment: Alignment.centerLeft,
      child: Text(
        nombreProducto,
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    final detallesProducto = Container(
      margin: EdgeInsets.only(left: 15.0),
      alignment: Alignment.centerLeft,
      child: Text(
        "Detalles",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    final alto = Container(
      margin: EdgeInsets.only(left: 15.0),
      alignment: Alignment.centerLeft,
      child: Text(
        "Alto: $altoProducto",
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
    final ancho = Container(
      margin: EdgeInsets.only(left: 15.0),
      alignment: Alignment.centerLeft,
      child: Text(
        "Ancho: $anchoProducto",
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
    final fondo = Container(
      margin: EdgeInsets.only(left: 15.0),
      alignment: Alignment.centerLeft,
      child: Text(
        "Fondo: $fondoProducto",
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
    //ACCIONES
    final botonAnadirCarro = ButtonTheme(
      height: 40,
      child: RaisedButton(
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        color: Colors.orange,
        child: Text("Añadir a carrito"),
        onPressed: () {},
      ),
    );
    final muestraPrecioProducto = Text(
      precioProducto,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 20.0),
    );
    //Propiedades
    final comboModelo = DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),

      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

    );

    // ****************** CONTENEDORES *****************

    final carouselProducto = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .40,
      child: coverScreenExample,
    );
    //DETALLES
    final cajonDescripcionProducto = Column(
      children: <Widget>[modeloProducto, detallesProducto, alto, ancho, fondo],
    );
    final descripcionProducto = Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        cajonDescripcionProducto
      ],
    );
    //PROPIEDADES
    final propiedadesProducto = Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: comboModelo,
              ),
              Expanded(
                child: comboModelo,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: comboModelo,
              ),
              Expanded(
                child: comboModelo,
              )
            ],
          )
        ],
      ),
    );
    //ACCIONES
    final contenedorPrecioProducto = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 15.0, bottom: 5.0),
            child: Text("PRECIO")),
        Container(
            margin: EdgeInsets.only(left: 15.0), child: muestraPrecioProducto)
      ],
    );
    final accionesProducto = Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.10,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: contenedorPrecioProducto,
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: botonAnadirCarro,
                )),
              ],
            )
          ],
        ));
    final contenidoProducto = Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .77,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                carouselProducto,
                descripcionProducto,
                propiedadesProducto,
              ]),
            )
          ],
        ));

    return Scaffold(
        appBar: AppBar(
          title: Text('Producto'),
        ),
        body: Container(
          child: new Stack(
            children: <Widget>[
              new Positioned(
                child: contenidoProducto,
              ),
              new Positioned(
                child: new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: accionesProducto),
              )
            ],
          ),
        ));
  }
}

void setState(Null Function() param0) {
}

