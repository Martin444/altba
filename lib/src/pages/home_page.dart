import 'package:flutter/material.dart';
import 'package:altba/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Altba Inicio'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Email: ${ bloc.email }'),
            Text('Password: ${ bloc.password }')
          ],
      ),
      drawer: _crearMenu(),
    );
  }

  _crearMenu(){

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/menu-img.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),

          ListTile(
            leading: Icon( Icons.home, color: Colors.black ),
            title: Text('Inicio'),
            onTap: (){ },
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
            onTap: (){ },
          ),
        ],
      ),
    );


  }

}