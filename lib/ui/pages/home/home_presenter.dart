import '../../../domain/entities/entities.dart';

abstract class HomePresenter {
  Stream<List<PersonEntity>> get peopleStream;

  Future<void> loadPersons();
  Future<bool> logout();
  Future<void> remoteAddUser({required String name});
  Future<void> remoteLoadUsers();
}
