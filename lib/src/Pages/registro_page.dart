import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/inicio_sesion.dart';

class RegistroPage extends StatelessWidget {
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
                    border: OutlineInputBorder(),
                    labelText: 'Nombre Completo',
                  ),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.account_circle_outlined, color: Colors.black),
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuario',
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.email, color: Colors.black),
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo',
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.local_phone, color: Colors.black),
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Teléfono',
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.https, color: Colors.black),
                title: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                ),
              ),
              FlatButton(
                  child: Text('Registrarse'),
                  color: Colors.orange[400],
                  textColor: Colors.white,
                  height: 40,
                  onPressed: () {}),
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
        .push(MaterialPageRoute(builder: (context) => InicioSesion()));
  }
}
