import 'package:flutter/foundation.dart';

enum FirebaseAuthError {
  emailAlreadyInUse,
  internalError,
  invalidEmail,
  operationNotAllowed,
  userDisabled,
  userNotFound,
  wrongPassword,
  weakPassword,
}

extension FirebaseAuthErrorExtension on FirebaseAuthError {
  String get name => describeEnum(this);

  String get code {
    switch (this) {
      case FirebaseAuthError.emailAlreadyInUse:
        return 'email-already-in-use';
      case FirebaseAuthError.internalError:
        return 'internal-error';
      case FirebaseAuthError.invalidEmail:
        return 'invalid-email';
      case FirebaseAuthError.operationNotAllowed:
        return 'operation-not-allowed';
      case FirebaseAuthError.userDisabled:
        return 'user-disabled';
      case FirebaseAuthError.userNotFound:
        return 'user-not-found';
      case FirebaseAuthError.wrongPassword:
        return 'wrong-password';
      case FirebaseAuthError.weakPassword:
        return 'weak-password';
      default:
        return 'internal-error';
    }
  }
}
