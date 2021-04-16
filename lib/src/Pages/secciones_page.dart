import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/detalle_platillo.dart';
import 'package:semestral_flutter/src/Pages/registro_page.dart';

class SeccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        body: ListView(children: <Widget>[
          _card1(context),
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
          Row(
            children: <Widget>[
              FlatButton(
                  child: Image.asset('lib/src/images/Caldos.png'),
                  height: 30,
                  textColor: Colors.orange[400],
                  color: Colors.white24,
                  padding: const EdgeInsets.only(left: 13, top: 15),
                  onPressed: () {
                    _navigateToNextScreen(context);
                  }),
              FlatButton(
                  child: Image.asset('lib/src/images/Plato fuerte.png'),
                  height: 30,
                  textColor: Colors.orange[400],
                  color: Colors.white24,
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  onPressed: () {
                    _navigateToNextScreen(context);
                  })
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  child: Image.asset('lib/src/images/Postres.png'),
                  height: 30,
                  textColor: Colors.orange[400],
                  color: Colors.white24,
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  onPressed: () {
                    _navigateToNextScreen(context);
                  }),
              FlatButton(
                  child: Image.asset('lib/src/images/Especial.png'),
                  height: 30,
                  textColor: Colors.orange[400],
                  color: Colors.white24,
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  onPressed: () {
                    _navigateToNextScreen(context);
                  })
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  child: Image.asset('lib/src/images/Comida rápida.png'),
                  height: 30,
                  textColor: Colors.orange[400],
                  color: Colors.white24,
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  onPressed: () {
                    _navigateToNextScreen(context);
                  }),
              FlatButton(
                  child: Image.asset('lib/src/images/Bebidas alcoholicas.png'),
                  height: 30,
                  textColor: Colors.orange[400],
                  color: Colors.white24,
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  onPressed: () {
                    _navigateToNextScreen(context);
                  })
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  child: Image.asset('lib/src/images/Refrescos.png'),
                  height: 30,
                  textColor: Colors.orange[400],
                  color: Colors.white24,
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  onPressed: () {
                    _navigateToNextScreen(context);
                  }),
              FlatButton(
                  child: Image.asset('lib/src/images/Souvenirs.png'),
                  height: 30,
                  textColor: Colors.orange[400],
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  onPressed: () {
                    _navigateToNextScreen(context);
                  })
            ],
          ),
          Container(padding: EdgeInsets.all(4.0), child: Text(''))
        ]));

    return Container(
      padding: EdgeInsets.only(left: 2, right: 10),
      margin: EdgeInsets.only(left: 30, right: 30, top: 0),
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

  Widget _card1(BuildContext context) {
    final card = Container(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  FlatButton(
                      child: Text('Menu'),
                      textColor: Colors.black,
                      height: 40,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CarritoPage()));
                      }),
                  FlatButton(
                      child: Text('Pedidos'),
                      textColor: Colors.black,
                      height: 40,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CarritoPage()));
                      }),
                ],
              ),
              Container(padding: EdgeInsets.all(0.0), child: Text(''))
            ]));

    return Container(
      //Guga, si no te sale centrado es por esto xd
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DetallePage()));
  }
}
