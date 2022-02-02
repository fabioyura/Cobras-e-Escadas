import 'package:cobras_e_escadas/cobras_escadas.dart';
import 'package:cobras_e_escadas/pages/inicio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cobras e Escadas',
      home: InicioPage(),
      navigatorKey: CobraEscadas.navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
