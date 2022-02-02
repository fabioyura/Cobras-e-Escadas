import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../cobras_escadas.dart';

class PainelDados extends StatelessWidget {
  const PainelDados({Key? key, required this.orientation, required this.size})
      : super(key: key);

  final Orientation orientation;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffffe9c4),
              borderRadius: BorderRadius.circular(10)),
          child: Flex(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            direction: orientation != Orientation.portrait
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              Spacer(),
              Flexible(
                child: Container(
                  width: size * 0.2,
                  height: size * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10)),
                  child: Observer(builder: (_) {
                    if (CobraEscadas.dados.valueDado1 == 0) {
                      return Container();
                    }
                    return Center(
                      child: Image.asset(
                        'assets/images/dado${CobraEscadas.dados.valueDado1}.png',
                        width: size * 0.18,
                        height: size * 0.18,
                      ),
                    );
                  }),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Observer(builder: (_) {
                    return Text(
                      (CobraEscadas.dados.valueDado1 +
                              CobraEscadas.dados.valueDado2)
                          .toString(),
                      style: TextStyle(fontSize: 20),
                    );
                  }),
                ),
              ),
              Flexible(
                child: Container(
                  width: size * 0.2,
                  height: size * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10)),
                  child: Observer(builder: (_) {
                    if (CobraEscadas.dados.valueDado2 == 0) {
                      return Container();
                    }
                    return Center(
                      child: Image.asset(
                        'assets/images/dado${CobraEscadas.dados.valueDado2}.png',
                        width: size * 0.18,
                        height: size * 0.18,
                      ),
                    );
                  }),
                ),
              ),
              Spacer(),
            ],
          ),
        ));
  }
}
