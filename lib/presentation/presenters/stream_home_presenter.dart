import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../data/http/http.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

class StreamHomePresenter implements HomePresenter {
  final LoadPeople loadPeople;

  StreamHomePresenter({
    required this.loadPeople,
  });

  final StreamController<List<PersonEntity>> peopleStreamController = StreamController<List<PersonEntity>>();

  Stream<List<PersonEntity>> get peopleStream => peopleStreamController.stream;

  Future<void> loadPersons() async {
    try {
      final List<PersonEntity> people = await loadPeople.loadPeople();
      peopleStreamController.add(people);
    } on HttpError catch (error) {
      debugPrint(error.toString());
    }
  }
}
