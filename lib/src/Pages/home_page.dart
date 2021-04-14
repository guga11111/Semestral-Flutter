import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/src/images/Fondo.jpeg"),
                fit: BoxFit.cover)),
      ),
      appBar: AppBar(
        title: Text('Semestral'),
      ),
      //body: ListTile(
      //  title: Text('Hola'),
      //  subtitle: Text('Hola2'),
      // ),
    );
  }
}