import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../data/firebase/firebase.dart';
import '../../data/http/http.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final FirebaseAuthentication firebaseAuthentication;
  final LoadPeople loadPeople;

  GetxHomePresenter({
    required this.firebaseAuthentication,
    required this.loadPeople,
  });

  final Rx<List<PersonEntity>> _people = Rx<List<PersonEntity>>([]);

  Stream<List<PersonEntity>> get peopleStream => _people.stream;

  Future<void> loadPersons() async {
    try {
      final List<PersonEntity> people = await loadPeople.loadPeople();
      _people.subject.add(people);
    } on HttpError catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<bool> logout() async {
    try {
      await firebaseAuthentication.logout();
      return true;
    } catch (_) {
      return false;
    }
  }
}
