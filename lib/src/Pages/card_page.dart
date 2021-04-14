import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
    ),
    body: ListView(
      children: <Widget>[_cardt1()],
    ),
    );
  }

  Widget _cardt1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.assistant_photo, color:Colors.cyanAccent),
            title: Text('Miguel Salvador Gómez Díaz'),
            subtitle: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('Aceptar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              )
            ],
          )
        ],),
    );
  }
}