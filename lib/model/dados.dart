import 'package:mobx/mobx.dart';

part 'dados.g.dart';

class Dados = _DadosBase with _$Dados;

abstract class _DadosBase with Store {
  @observable
  int posAvatar1 = 0;

  @observable
  int posAvatar2 = 0;

  @observable
  int valueDado1 = 0;

  @observable
  int valueDado2 = 0;

  @observable
  bool vez = true;

  @observable
  bool block = false;

  @observable
  bool jogarNovamente = false;

  @observable
  bool finalizado = false;

  @observable
  bool alterAnimate = false;
}

class Cobra {
  static List<Cobra> cobras = [
    Cobra(99, 80),
    Cobra(95, 75),
    Cobra(92, 88),
    Cobra(89, 68),
    Cobra(74, 53),
    Cobra(62, 19),
    Cobra(64, 60),
    Cobra(46, 25),
    Cobra(49, 11),
    Cobra(16, 6),
  ];
  final int inicial;
  final int fim;

  static int verif(int pos) {
    for (var cobra in cobras) {
      if (pos == cobra.inicial) {
        return cobra.fim;
      }
    }
    return 0;
  }

  Cobra(this.inicial, this.fim);
}

class Escada {
  static List<Escada> escadas = [
    Escada(2, 38),
    Escada(7, 14),
    Escada(8, 31),
    Escada(15, 26),
    Escada(21, 42),
    Escada(36, 44),
    Escada(51, 67),
    Escada(71, 91),
    Escada(78, 98),
    Escada(87, 94),
  ];
  final int inicial;
  final int fim;

  static int verif(int pos) {
    for (var escada in escadas) {
      if (pos == escada.inicial) {
        return escada.fim;
      }
    }
    return 0;
  }

  Escada(this.inicial, this.fim);
}
