import 'package:firebase_auth/firebase_auth.dart';

import '../../data/firebase/firebase.dart';

class FirebaseAuthenticationAdapter implements FirebaseAuthentication {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthenticationAdapter({
    required this.firebaseAuth,
  });

  @override
  Future<UserCredential> authWithEmailAndPassword({required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (error) {
      if (error.code == FirebaseAuthError.invalidEmail.code) {
        throw FirebaseAuthError.invalidEmail;
      } else if (error.code == FirebaseAuthError.userDisabled.code) {
        throw FirebaseAuthError.userDisabled;
      } else if (error.code == FirebaseAuthError.userNotFound.code) {
        throw FirebaseAuthError.userNotFound;
      } else if (error.code == FirebaseAuthError.wrongPassword.code) {
        throw FirebaseAuthError.wrongPassword;
      } else {
        throw FirebaseAuthError.internalError;
      }
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
