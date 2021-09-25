import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../data/models/models.dart';
import '../../infra/http/http.dart';
import '../../shared/api_url.dart';
import '../../ui/pages/pages.dart';

class StreamHomePresenter implements HomePresenter {
  final HttpClient client;

  StreamHomePresenter({
    required this.client,
  });

  final StreamController<List<RemotePersonModel>> peopleStreamController = StreamController<List<RemotePersonModel>>();

  Stream<List<RemotePersonModel>> get peopleStream => peopleStreamController.stream;

  Future<void> loadPersons() async {
    try {
      final List<dynamic>? response = await client.request(url: '$apiUrl/people', method: 'get');

      if (response != null) {
        List<RemotePersonModel> people =
            response.map((person) => RemotePersonModel.fromJson(person as Map<String, dynamic>)).toList();
        peopleStreamController.add(people);
      }
    } on HttpError catch (error) {
      debugPrint(error.toString());
    }
  }
}
