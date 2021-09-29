abstract class Authentication {
  Future<void> authWithEmailAndPassword({AuthenticationWithEmailAndPasswordParams params});
}

class AuthenticationWithEmailAndPasswordParams {
  final String email;
  final String password;

  AuthenticationWithEmailAndPasswordParams({
    required this.email,
    required this.password,
  });
}
