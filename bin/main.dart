import 'dart:async';

Future<void> addEventsToStream(StreamController presenter) async {
  //adicionando os dados que serão captados pelo stream
  presenter.sink.add('Gabriel');
  await Future.delayed(const Duration(seconds: 2));
  // throw '403';
  presenter.sink.add(2021);
  await Future.delayed(const Duration(seconds: 2));
  presenter.sink.add({'nome': 'Gabriel', 'idade': 23, 'team': 'Flutter'});
}

void main() async {
  //criando stream
  final presenter = StreamController();

  //adicionando um listener ao stream que vai ouvir o stram
  presenter.stream.listen(
    (data) async {
      print('${data}');
    },
    onError: (error) {
      print(error);
    },
    onDone: () {
      print('Stream foi fechada');
    },
  );

  try {
    await addEventsToStream(presenter);
  } catch (error) {
    presenter.sink.addError('HttpError: $error');
  }

  //fechando stream
  presenter.close();
}
