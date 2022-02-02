import 'package:cobras_e_escadas/componentes/board.dart';
import 'package:cobras_e_escadas/componentes/painelDados.dart';
import 'package:cobras_e_escadas/componentes/painelInferior.dart';
import 'package:cobras_e_escadas/pages/inicio.dart';
import 'package:flutter/material.dart';

import '../cobras_escadas.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffab72db),
          title: const Text(
            "Cobras e Escadas",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Heebog'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  CobraEscadas.dados.posAvatar1 = 0;
                  CobraEscadas.dados.posAvatar2 = 0;
                  CobraEscadas.dados.vez = false;
                  CobraEscadas.dados.valueDado1 = 0;
                  CobraEscadas.dados.valueDado2 = 0;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) {
                    return InicioPage();
                  }), (route) => false);
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          Orientation orientation = MediaQuery.of(context).orientation;
          double size = orientation == Orientation.portrait
              ? constraints.maxWidth
              : constraints.maxHeight;
          return Flex(
            direction: orientation == Orientation.portrait
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              Board(orientation: orientation, size: size),
              PainelInferior(orientation: orientation, size: size),
              PainelDados(orientation: orientation, size: size),
            ],
          );
        }));
  }
}
