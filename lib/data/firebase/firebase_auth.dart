import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthentication {
  Future<UserCredential> authWithEmailAndPassword({required String email, required String password});
  Future<void> logout();
}
