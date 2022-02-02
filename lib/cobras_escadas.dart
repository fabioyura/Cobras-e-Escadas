import 'dart:math';

import 'package:cobras_e_escadas/model/dados.dart';
import 'package:flutter/material.dart';

class CobraEscadas {
  static Dados dados = Dados();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static void moverAvatarDiretamente(int posicao, int avatar) async {
    await Future.delayed(Duration(seconds: 2), () {
      if (avatar == 1) {
        dados.posAvatar1 = posicao;
      } else {
        dados.posAvatar2 = posicao;
      }
    });

    finalizaJogada();
  }

  static void jogar(int dado1, int dado2) async {
    if (dados.finalizado) {
      inicializarJogo();
      return;
    }

    dados.valueDado1 = dado1;
    dados.valueDado2 = dado2;
    if (dado1 == 0) {
      return;
    }
    if (dado1 == dado2) {
      dados.jogarNovamente = true;
    }

    dados.block = true;

    int soma = dado1 + dado2;

    int posicaoAtual = dados.vez ? dados.posAvatar1 : dados.posAvatar2;

    int posicaoFinal = posicaoAtual + soma;

    if (posicaoFinal >= 100) {
      /* posicaoFinal = 100 - (posicaoFinal - 100);
      await moverAvatar(100, dados.vez ? 1 : 2, true);*/
      await moverAvatar(posicaoFinal, dados.vez ? 1 : 2, false);
      finalizarJogo();
    } else {
      await moverAvatar(posicaoFinal, dados.vez ? 1 : 2, false);
    }
    /*if (posicaoFinal >= 100) {
      finalizarJogo();
    }*/
  }

  static void finalizarJogo() {
    dados.finalizado = true;
    exibirAviso(
        "Parabéns, jogador " + (!dados.vez ? "1" : "2") + ", você venceu!");
  }

  static void inicializarJogo() {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (context) {
        return AlertDialog(
          content: Text("O jogo acabou!, deseja jogar novamente?"),
          actions: <Widget>[
            MaterialButton(
              child: Text("Sim!"),
              onPressed: () {
                dados.finalizado = false;
                dados.vez = true;
                dados.posAvatar1 = 0;
                dados.posAvatar2 = 0;
                dados.jogarNovamente = false;
                dados.block = false;
                dados.valueDado1 = 0;
                dados.valueDado2 = 0;
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              child: Text("Não"),
              onPressed: () {
                Navigator.of(context).pop();
                dados.finalizado = true;
              },
            ),
          ],
        );
      },
    );
  }

  static void jogarDado() async {
    if (!dados.block) {
      jogar(Random().nextInt(6) + 1, Random().nextInt(6) + 1);
    }
  }

  static void moverDiretamente(int posicao, int avatar) {
    if (avatar == 1) {
      dados.posAvatar1 = posicao;
    } else {
      dados.posAvatar2 = posicao;
    }
  }

  static void verificaObjetos(int pos, int avatar) {
    int value = Cobra.verif(pos);
    if (value == 0) {
      value = Escada.verif(pos);
      if (value > 0) {
        exibirSnake("Legal, você achou uma escada!", Colors.green);
      }
    } else {
      exibirSnake("Vish, parece que você encontrou uma cobra!", Colors.red);
      dados.alterAnimate = true;
    }
    if (value != 0) {
      moverAvatarDiretamente(value, avatar);
    } else {
      finalizaJogada();
    }
  }

  static void finalizaJogada() {
    dados.alterAnimate = false;
    dados.block = false;
    if (!dados.jogarNovamente) {
      dados.vez = !dados.vez;
    } else {
      dados.jogarNovamente = false;
    }
  }

  //metodo usado para mover o avatar casa a casa,
  // usado apos o valor do dador ser obtido.
  static Future moverAvatar(int posicao, int avatar, bool pendencia) async {
    if (avatar == 1) {
      while (dados.posAvatar1 != posicao) {
        await Future.delayed(Duration(seconds: 1), () {
          if (posicao > dados.posAvatar1) {
            dados.posAvatar1++;
          } else {
            dados.posAvatar1--;
          }
        });
      }

      //dados.posAvatar1 = posicao;
    } else {
      while (dados.posAvatar2 != posicao) {
        await Future.delayed(Duration(seconds: 1), () {
          if (posicao > dados.posAvatar2) {
            dados.posAvatar2++;
          } else {
            dados.posAvatar2--;
          }
        });
      }
    }
    if (!pendencia) {
      verificaObjetos(
          avatar == 1 ? dados.posAvatar1 : dados.posAvatar2, avatar);
    }
  }

  static double calculaLocalizacaoX(int posicao, double size) {
    double pos = 0;

    int realPos = posicao - 1;

    double posSize = size / 10;

    int dezena = realPos ~/ 10;

    int unidade = realPos % 10;

    if (dezena % 2 == 0) {
      pos = (unidade) * posSize;
    } else {
      pos = (posSize * 10) - (((realPos % 10)) * posSize);
      pos -= posSize;
    }

    return pos;
  }

  static double calculaLocalizacaoY(int posicao, double size) {
    double pos = 0;

    double posSize = size / 10;

    int realPos = posicao - 1;

    int dezena = realPos ~/ 10;

    pos = dezena * posSize;

    return pos;
  }

  static void exibirAviso(String aviso) {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (context) {
        return AlertDialog(
          content: Text(aviso),
          actions: <Widget>[
            MaterialButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  static void exibirSnake(String texto, Color cor) {
    ScaffoldMessenger.of(navigatorKey.currentState!.overlay!.context)
        .showSnackBar(
      SnackBar(
        backgroundColor: cor,
        content: Text(texto),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
