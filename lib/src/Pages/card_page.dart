import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        appBar: AppBar(title: Text('Card Page')),
        body: ListView(children: <Widget>[
          _card(),
          SizedBox(
            height: 50,
          ),
        ]));
  }

  Widget _card() {
    final card = Container(
        child: Column(children: <Widget>[
      ListTile(title: Text("")),
      Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.black),
            title: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Usuario',
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
              child: Text('Iniciar sesión'),
              color: Colors.orange[400],
              textColor: Colors.white,
              height: 60,
              onPressed: () {}),
          FlatButton(
              child: Text('Registrarse'),
              textColor: Colors.orange[400],
              color: Colors.white24,
              height: 60,
              onPressed: () {})
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
}
