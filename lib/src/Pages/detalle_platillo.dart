import 'package:flutter/material.dart';
//import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';
import 'package:semestral_flutter/src/Pages/registro_page.dart';

class DetallePage extends StatelessWidget {
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
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
              width: 160.0,
              height: 160.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage(
                          "lib/src/images/pozole_acapulco.jpg")))),
          Column(
            children: <Widget>[
              ListTile(
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Nombre del platillo',
                  ),
                ),
              ),
              ListTile(
                title: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Precio del platillo',
                  ),
                ),
              ),
              ListTile(
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Ingredientes',
                  ),
                ),
              ),
              DropdownButton<String>(
                items: <String>['Sopas', 'Comida rápida', 'Bebidas', 'Algo más']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              FlatButton(
                  child: Text('Guardar'),
                  color: Colors.orange[400],
                  textColor: Colors.white,
                  height: 40,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListaPedidos()));
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
}
