import 'package:flutter/material.dart';

import 'package:altba/src/pages/home_page.dart';
import 'package:altba/src/providers/usuario_provider.dart';


class MenuWidget extends StatelessWidget {

  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          /*DrawerHeader(
            child: Container(),
          ),*/
          new UserAccountsDrawerHeader(
            //currentAccountPicture: Image.asset('assets/icon/altba-icon.png'),
            accountName: Text('Víctor Flores'),
            accountEmail: Text('test@test.com'),
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
            onTap: ()=> Navigator.pushReplacementNamed( context, HomePage.routeName ),
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

  _logout(BuildContext context, authData ) async {

    usuarioProvider.logout( authData.idToken );

    Navigator.pushReplacementNamed(context, 'login');

  }
}