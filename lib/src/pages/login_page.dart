import 'package:flutter/material.dart';
import 'package:altba/src/bloc/provider.dart';
import 'package:altba/src/providers/usuario_provider.dart';

import 'package:altba/src/utils/utils.dart';

class LoginPage extends StatelessWidget {

  final usuarioProvider = new UsuarioProvider();

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

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              color: Colors.white,
              height: 120.0,
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
                SizedBox( height: 30.0),
                Image.asset(
                  'assets/images/altba-negro.png',
                  width: 250,
                ),
                SizedBox( height: 30.0),
                _crearEmail( bloc ),
                SizedBox( height: 20.0),
                _crearPassword( bloc ),
                SizedBox( height: 50.0),
                _crearBoton( bloc ),
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

  Widget _crearEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
      
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.alternate_email, color: Colors.black),
            hintText: 'usuario@correo.com',
            labelText: 'Correo electrónico',
            //counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changeEmail,
        ),
      );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Colors.black),
              hintText: '**********',
              labelText: 'Contraseña',
              //counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton( LoginBloc bloc ) {

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){

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
          onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {

    Map info = await usuarioProvider.login(bloc.email, bloc.password);

    if ( info['ok'] ){

      Navigator.pushReplacementNamed(context, 'home');

    } else {

      mostrarAlerta( context, info['mensaje'] );

    }

  }

}