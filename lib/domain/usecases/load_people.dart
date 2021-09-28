import '../entities/entities.dart';

abstract class LoadPeople {
  Future<List<PersonEntity>> loadPeople();
}
