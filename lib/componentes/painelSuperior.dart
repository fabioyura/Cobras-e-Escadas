import 'package:cobras_e_escadas/cobras_escadas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PainelSuperior extends StatelessWidget {
  PainelSuperior({Key? key, required this.orientation, required this.size})
      : super(key: key);

  final Orientation orientation;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction:
          orientation != Orientation.portrait ? Axis.vertical : Axis.horizontal,
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white10, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Flex(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  direction: orientation == Orientation.portrait
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    Flexible(
                        child: Text(
                      "Jogadores \n aguardando",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    )),
                    Observer(builder: (_) {
                      if (CobraEscadas.dados.posAvatar2 != 0) {
                        return Container();
                      }
                      return Flexible(
                        child: Container(
                          width: size / 10,
                          height: size / 10,
                          child: Image.asset("assets/images/avatar2.png"),
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      if (CobraEscadas.dados.posAvatar1 != 0) {
                        return Container();
                      }
                      return Flexible(
                        child: Container(
                          width: size / 10,
                          height: size / 10,
                          child: Image.asset("assets/images/avatar1.png"),
                        ),
                      );
                    }),
                    ////////
                  ]),
            ),
          ),

          ////////
        ),
      ],
    );
  }
}
