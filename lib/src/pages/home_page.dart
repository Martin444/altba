import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';


final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HomePage extends StatelessWidget {

  const HomePage({Key key, this.user,}) : super(key: key);
  final AuthResult user;

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    //Traemos los datos de de Users
    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance.collection('users').document(user.user.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if(snapshot.hasData){
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
                          body: ListView(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Column(children: [
                                    CarouselWithIndicator(),
                                  ]
                                )
                              ),
                            ],
                          ),
                        drawer: menuWidget(snapshot.data),
                  );
        }else{
          //SI no devuelve el usuario
          return LinearProgressIndicator();
        }
      },
    );
  }

 Widget menuWidget( DocumentSnapshot snapshot){
          if(snapshot.data == null){
            return Center(child: Text("No hay datos para mostrar"),);
          }else{
            print(snapshot.data);
            var name = snapshot.data['name'];
            var correo = snapshot.data['email'];
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  /*DrawerHeader(
                    child: Container(),
                  ),*/
                  new UserAccountsDrawerHeader(
                    //currentAccountPicture: Image.asset('assets/icon/altba-icon.png'),
                    accountName: Text('$name'),
                    accountEmail: Text('$correo'),
                  currentAccountPicture: GestureDetector(
                    child: new CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                      color: Colors.black,
                      ),
                    ),
                  ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/menu-img.jpg'),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),

                  ListTile(
                    leading: Icon( Icons.home, color: Colors.black ),
                    title: Text('Inicio'),
                    onTap: (){}
                  ),

                  ListTile(
                    leading: Icon( Icons.assignment_ind, color: Colors.black ),
                    title: Text('Mi cuenta'),
                    onTap: (){ },
                  ),

                  ListTile(
                    leading: Icon( Icons.category, color: Colors.black ),
                    title: Text('Categorías'),
                    onTap: (){ },
                  ),

                  ListTile(
                    leading: Icon( Icons.favorite, color: Colors.black ),
                    title: Text('Favoritos'),
                    onTap: (){ },
                  ),

                  ListTile(
                    leading: Icon( Icons.check_box, color: Colors.black ),
                    title: Text('Mis Pedidos'),
                    onTap: (){ },
                  ),

                  ListTile(
                    leading: Icon( Icons.history, color: Colors.black ),
                    title: Text('Historial'),
                    onTap: (){ },
                  ),
                  SizedBox( height: 150.0),
                  ListTile(
                    leading: Icon( Icons.backspace, color: Colors.black ),
                    title: Text('Cerrar Sesión'),
                    //onTap: ()=> _logout( authData, context ),
                  ),
                ],
              ),
            );
          }

        }


}


final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: child,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          imgList,
          (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          },
        ),
      ),
    ]);
  }
}