import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../cobras_escadas.dart';

class PainelInferior extends StatelessWidget {
  const PainelInferior(
      {Key? key, required this.orientation, required this.size})
      : super(key: key);

  final Orientation orientation;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffe9c4),
        ),
        child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            direction: orientation == Orientation.portrait
                ? Axis.horizontal
                : Axis.vertical,
            children: [
              Flexible(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: Observer(builder: (_) {
                      return Container(
                        decoration: BoxDecoration(
                          color: CobraEscadas.dados.vez
                              ? Colors.red
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Jogador 1",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              Observer(builder: (_) {
                                return Text(
                                    CobraEscadas.dados.posAvatar1.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1);
                              }),
                            ],
                          ),
                        ),
                      );
                    })

                    ///////////////////
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                  return Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          offset: Offset(10, 10),
                          blurRadius: 15)
                    ]),
                    child: MaterialButton(
                        clipBehavior: Clip.antiAlias,
                        color: Color(0xffab72db),
                        disabledColor: Colors.grey,
                        child: Container(
                          width: size * 0.3,
                          height: size * 0.15,
                          child: const Center(
                            child: Text(
                              "Jogar Dados",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: CobraEscadas.dados.block
                            ? null
                            : CobraEscadas.jogarDado),
                  );
                }),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: Observer(builder: (_) {
                    return Container(
                      decoration: BoxDecoration(
                        color: !CobraEscadas.dados.vez
                            ? Colors.red[400]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Jogador 2",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                            Observer(builder: (_) {
                              return Text(
                                CobraEscadas.dados.posAvatar2.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              );
                            })
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ]),
      ),
    );
  }
}
