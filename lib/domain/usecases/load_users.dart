import '../entities/entities.dart';

abstract class LoadUsers {
  Future<List<PersonEntity>> loadUsers();
}
