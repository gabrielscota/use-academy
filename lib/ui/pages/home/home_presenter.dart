import '../../../data/models/models.dart';

abstract class HomePresenter {
  Stream<List<RemotePersonModel>> get peopleStream;

  Future<void> loadPersons();
}
