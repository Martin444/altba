import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _loginForm( context ),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),

          Container(
            width: size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: <Widget>[
                /*_logoLogin(),
                //SizedBox( height: 60.0),*/
                _crearEmail(),
                SizedBox( height: 40.0),
                _crearPassword(),
                SizedBox( height: 30.0),
                _crearBoton(),
              ],
            ),
          ),

          SizedBox( height: 30.0),
          Text('Olvide mi contraseña'),
          SizedBox( height: 30.0),
        ],
      ),
    );

  }

  /*Widget _logoLogin() {

    return Container(
      child: ListView(
        children: [
          Image.asset(
            'lib/src/assets/images/altba-negro.png',
            height: 20,
          ),
        ],
      ),
    );
  }*/


  Widget _crearEmail() {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon( Icons.alternate_email, color: Colors.black),
          hintText: 'usuario@correo.com',
          labelText: 'Correo electrónico',
        ),
      ),

    );
  }

  Widget _crearPassword() {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon( Icons.lock_outline, color: Colors.black),
          hintText: '**********',
          labelText: 'Contraseña',
        ),
      ),

    );
  }

  Widget _crearBoton() {

    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
        child: Text('Iniciar Sesión'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,
      color: Colors.black,
      textColor: Colors.white,
      onPressed: (){},
    );
  }

}