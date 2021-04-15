import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Card Page')),
        body: ListView(children: <Widget>[
          _cardt1(),
          SizedBox(
            height: 30,
          ),
          _card2(),
          SizedBox(
            height: 30,
          ),
          _card3(),
          SizedBox(
            height: 30,
          ),
        ]));
  }

  Widget _cardt1() {
    return Card(
        child: Column(children: <Widget>[
      ListTile(
        leading: Icon(Icons.assistant_photo, color: Colors.cyanAccent),
        title: Text("Inicio de sesión"),
      ),
      Row(
        children: <Widget>[
          FlatButton(child: Text('Aceptar'), onPressed: () {}),
          FlatButton(child: Text('Aceptar'), onPressed: () {})
        ],
      )
    ]));
  }

  Widget _card2() {
    final card = Container(
        child: Column(children: <Widget>[
      FadeInImage(
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2021/01/21/17/58/herbstastern-5938056_1280.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(microseconds: 500),
          height: 200.0,
          fit: BoxFit.cover),
      Container(
          padding: EdgeInsets.all(5.0), child: Text('Descripcion de la imagen'))
    ]));

    return Container(
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

  Widget _card3() {
    final card = Container(
        child: Column(children: <Widget>[
      FadeInImage(
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2021/01/21/17/58/herbstastern-5938056_1280.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(microseconds: 500),
          height: 200.0,
          fit: BoxFit.cover),
      Container(
          padding: EdgeInsets.all(5.0), child: Text('Descripcion de la imagen'))
    ]));

    return Container(
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
