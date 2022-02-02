import 'package:cobras_e_escadas/cobras_escadas.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Board extends StatelessWidget {
  Board({Key? key, required this.orientation, required this.size})
      : super(key: key);

  final Orientation orientation;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: <Widget>[
            Container(
              height: size,
              width: size,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/board.jpg"),
                      fit: BoxFit.contain)),
            ),
            Observer(builder: (_) {
              if (CobraEscadas.dados.posAvatar1 == 0) {
                return Container();
              }
              return AnimatedPositioned(
                curve: !CobraEscadas.dados.alterAnimate
                    ? Curves.easeInOutBack
                    : Curves.elasticInOut,
                duration: !CobraEscadas.dados.alterAnimate
                    ? Duration(milliseconds: 500)
                    : Duration(seconds: 2),
                bottom: CobraEscadas.calculaLocalizacaoY(
                    CobraEscadas.dados.posAvatar1, size),
                left: CobraEscadas.calculaLocalizacaoX(
                    CobraEscadas.dados.posAvatar1, size),
                child: Container(
                  height: size / 10,
                  width: size / 10,
                  child: Center(
                      child:
                          Image.asset("assets/images/avatar1.png", scale: 0.7)),
                ),
              );
            }),
            Observer(builder: (_) {
              if (kDebugMode) {
                print("object");
              }

              if (CobraEscadas.dados.posAvatar2 == 0) {
                return Container();
              }

              return AnimatedPositioned(
                duration: !CobraEscadas.dados.alterAnimate
                    ? Duration(milliseconds: 500)
                    : Duration(seconds: 2),
                curve: !CobraEscadas.dados.alterAnimate
                    ? Curves.easeInOutBack
                    : Curves.elasticInOut,
                bottom: CobraEscadas.calculaLocalizacaoY(
                    CobraEscadas.dados.posAvatar2, size),
                left: CobraEscadas.calculaLocalizacaoX(
                    CobraEscadas.dados.posAvatar2, size),
                child: Container(
                  height: size / 10,
                  width: size / 10,
                  child: Center(
                      child:
                          Image.asset("assets/images/avatar2.png", scale: 0.7)),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
