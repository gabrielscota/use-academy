// ignore_for_file: avoid_print

import 'dart:async';

void main() {
  final controller = StreamController<int>.broadcast();
  controller.stream.where((value) => (value % 2 == 0)).listen((value) => print('$value'));

  //Verificando os valores pares e multiplos de 7 entre 1 e 256 via streamController
  for (int i = 1; i < 256; i += 7) {
    controller.sink.add(i);
  }
}
