import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'home_page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        
        children: <Widget>[
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                     borderRadius: BorderRadius.circular(5.0)
                   ),
                   child: Column(children: <Widget>[
                      SizedBox( height: 30.0),
                      Image.asset(
                        'assets/images/altba-negro.png',
                        width: 250,
                      ),
                      SizedBox( height: 30.0),
                                Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    icon: Icon( Icons.alternate_email, color: Colors.black),
                                    hintText: 'usuario@correo.com',
                                    labelText: 'Correo electrónico',
                                    //counterText: snapshot.data,
                                  ),
                                  onChanged: (input) => _email = input,
                                ),
                              ),
                                SizedBox( height: 30.0),
                                Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),

                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  icon: Icon( Icons.lock_outline, color: Colors.black),
                                  hintText: '**********',
                                  labelText: 'Contraseña',
                                  //counterText: snapshot.data,
                                  
                                ),
                                onChanged: (input) => _password = input,
                              ),
                            ),
                                SizedBox( height: 30.0),
                            RaisedButton(
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
                              onPressed: signin
                            )
                   ],),
                 ),

                  SizedBox( height: 30.0),
                  Text('Olvide mi contraseña'),
                  SizedBox( height: 30.0),

                ],
              )

          ),
        ],
      ),)
    );
  }

  void signin() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        AuthResult authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(user: authResult)));
      }catch(e){
         print("Error");
      }
    }
  }
}
