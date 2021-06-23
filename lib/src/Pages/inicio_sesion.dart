import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/menu_page.dart';
import 'package:semestral_flutter/src/Pages/registro_page.dart';
import 'package:semestral_flutter/src/Pages/secciones_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class InicioPage extends StatefulWidget {
  @override
  _InicioSesion createState() => _InicioSesion();
}

class _InicioSesion extends State<InicioPage> {
  String _email = '';
  String _pass = '';
  String user = '';
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
                  keyboardType: TextInputType.emailAddress,
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
                  child: Text('Iniciar sesión'),
                  color: Colors.orange[400],
                  textColor: Colors.white,
                  height: 40,
                  onPressed: () {
                    signInWithEmailAndPassword();
                  }),
              FlatButton(
                  child: Text('Registrarse'),
                  textColor: Colors.orange[400],
                  color: Colors.white24,
                  height: 40,
                  onPressed: () {
                    _navigateToNextScreen(context);
                  }),
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
        .push(MaterialPageRoute(builder: (context) => RegistroPage()));
  }

  signInWithEmailAndPassword() async {
    await Firebase.initializeApp();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _pass);
      var currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser.uid == "jKrdlg5dbfbyis6og7VDrgL8nB72") {
        print(currentUser.uid);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SeccionesPage()));
        print("ADMIN");
      } else {
        //user = currentUser.uid;
        print(currentUser.uid);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MenuPage(user: currentUser.email)));
        print("NORMAL");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else if (e != null) {
        print(e.code);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email o contraseña incorrecta")));
      }
    }
  }
}
