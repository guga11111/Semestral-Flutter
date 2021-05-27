import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/menu_page.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';
import 'package:semestral_flutter/src/Pages/registro_page.dart';
import 'package:semestral_flutter/src/Pages/inicio_sesion.dart';
import 'package:semestral_flutter/src/Pages/home_page.dart';
import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/detalle_platillo.dart';
import 'package:semestral_flutter/src/Pages/secciones_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'menu': (BuildContext context) => MenuPage(), //Aqui inicio de sesión
    '/': (BuildContext context) => InicioPage(),
    'registro': (BuildContext context) =>
        RegistroPage(), // Aqui debe ir registro xd
    'card': (BuildContext context) => HomePage(),
    'carrito': (BuildContext context) => CarritoPage(),
    'detalle': (BuildContext context) => DetallePage(),
    'secciones': (BuildContext context) => SeccionesPage(),
    'lista': (BuildContext context) => ListaPedidos()
  };
}
