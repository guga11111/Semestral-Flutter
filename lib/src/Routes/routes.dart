import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/alert_page.dart';
import 'package:semestral_flutter/src/Pages/registro_page.dart';
import 'package:semestral_flutter/src/Pages/inicio_sesion.dart';
import 'package:semestral_flutter/src/Pages/home_page.dart';
import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/detalle_pedido.dart';
import 'package:semestral_flutter/src/Pages/secciones_page.dart';


Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => SeccionesPage(), //Aqui inicio de sesión
    'alert': (BuildContext context) => AlertPage(),
    'registro': (BuildContext context) =>
        RegistroPage(), // Aqui debe ir registro xd
    'card': (BuildContext context) => HomePage(),
    'carrito': (BuildContext context) => CarritoPage(),
    'detalle': (BuildContext context) => DetallePage(),
    'secciones': (BuildContext context) => SeccionesPage()
  };
}
