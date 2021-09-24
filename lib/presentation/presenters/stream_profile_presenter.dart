import 'package:flutter/foundation.dart';

import '../../ui/pages/pages.dart';

class PersonModel {
  final String name;
  final double age;
  final double height;
  final String email;
  final String createdAt;

  PersonModel({
    required this.name,
    required this.age,
    required this.height,
    required this.email,
    required this.createdAt,
  });
}

class StreamProfilePresenter implements ProfilePresenter {
  late ProfilePersonViewModel person;

  @override
  void loadPerson() {
    final PersonModel personModel = PersonModel(
      name: 'Gabriel',
      age: 21,
      height: 1.75,
      email: 'gabriel.arruda@usemobile.com',
      createdAt: '23/09/2021',
    );

    person = ProfilePersonViewModel(name: personModel.name, age: personModel.age);

    debugPrint('StreamProfilePresenter');
  }
}
