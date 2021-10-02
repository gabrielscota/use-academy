import '../entities/entities.dart';

abstract class AddUser {
  Future<void> addUser({required PersonEntity user});
}
