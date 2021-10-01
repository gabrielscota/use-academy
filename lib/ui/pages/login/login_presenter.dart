abstract class LoginPresenter {
  Stream<String> get emailErrorStream;
  Stream<String> get passwordErrorStream;
  Stream<bool> get isFormValidStream;
  Stream<String> get userCredentialErrorStream;
  Stream<String> get navigateToStream;

  void validateEmail(String email);
  void validatePassword(String password);

  Future<void> auth();
}
