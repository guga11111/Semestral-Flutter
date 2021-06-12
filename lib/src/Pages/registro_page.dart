import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/inicio_sesion.dart';
import 'package:semestral_flutter/src/Pages/inicio_sesion.dart';
import 'package:semestral_flutter/src/Pages/secciones_page.dart';
import 'inicio_sesion.dart';
import 'menu_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  String _email = '';
  String _pass = '';
  String _nombre = '';
  String _tel = '';
  String _usuario = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        body: ListView(children: <Widget>[
          _card(context),
          SizedBox(
            height: 50,
          ),
        ]));
  }

  Widget _card(BuildContext context) {
    final card = Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          new Container(
              width: 120.0,
              height: 120.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          new AssetImage("lib/src/images/mr-bolat-logo.png")))),
          Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_circle, color: Colors.black),
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Nombre Completo',
                  ),
                  onChanged: (valor) => setState(() {
                    _nombre = valor;
                  }),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.account_circle_outlined, color: Colors.black),
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Usuario',
                  ),
                  onChanged: (valor) => setState(() {
                    _usuario = valor;
                  }),
                ),
              ),
              ListTile(
                leading: Icon(Icons.email, color: Colors.black),
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Correo',
                  ),
                  onChanged: (valor) => setState(() {
                    _email = valor;
                  }),
                ),
              ),
              ListTile(
                leading: Icon(Icons.local_phone, color: Colors.black),
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Teléfono',
                  ),
                  onChanged: (valor) => setState(() {
                    _tel = valor;
                  }),
                ),
              ),
              ListTile(
                leading: Icon(Icons.https, color: Colors.black),
                title: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                  onChanged: (valor) => setState(() {
                    _pass = valor;
                  }),
                ),
              ),
              FlatButton(
                  child: Text('Registrarse'),
                  color: Colors.orange[400],
                  textColor: Colors.white,
                  height: 40,
                  onPressed: () {
                    createUserWithEmailAndPassword();
                  }),
              FlatButton(
                  child: Text('Volver'),
                  textColor: Colors.orange[400],
                  color: Colors.white24,
                  height: 40,
                  onPressed: () {
                    _navigateToNextScreen(context);
                  })
            ],
          ),
          Container(padding: EdgeInsets.all(5.0), child: Text(''))
        ]));

    return Container(
      margin: const EdgeInsets.all(
          30), //Guga, si no te sale centrado es por esto xd
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 10,
                offset: Offset(2.0, 10.0))
          ],
          color: Colors.white),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InicioPage()));
  }

  createUserWithEmailAndPassword() async {
    Firebase.initializeApp();
    print('entro');
    try {
      print('entro2');
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _pass);
      collection();

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MenuPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  collection() {
    Firebase.initializeApp();
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("usuarios").doc(firebaseUser.uid).set({
      "Nombre": _nombre,
      "Correo": _email,
      "Contraseña": _pass,
      "Teléfono": _tel,
      "Usuario": _usuario,
    }).then((_) {
      print("success!");
    });
  }
}
