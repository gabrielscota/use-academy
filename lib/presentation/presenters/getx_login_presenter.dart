import 'package:get/get.dart';

import '../../ui/pages/pages.dart';
import '../protocols/protocols.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final Validation validation;

  GetxLoginPresenter({
    required this.validation,
  });

  String _email = '';
  String _password = '';

  Rx<String> emailError = Rx<String>('');
  Rx<String> passwordError = Rx<String>('');
  Rx<bool> isFormValid = Rx<bool>(false);

  Stream<String> get emailErrorStream => emailError.stream;
  Stream<String> get passwordErrorStream => passwordError.stream;
  Stream<bool> get isFormValidStream => isFormValid.stream;

  void validateEmail(String email) {
    _email = email;
    final String error = _validateField('email');
    emailError.subject.add(error);
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    final String error = _validateField('password');
    passwordError.subject.add(error);
    _validateForm();
  }

  void _validateForm() {
    isFormValid.subject.add(emailError.subject.value == '' &&
        passwordError.subject.value == '' &&
        _email.isNotEmpty &&
        _password.isNotEmpty);
  }

  String _validateField(String field) {
    final Map formData = {
      'email': _email,
      'password': _password,
    };
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField:
        return 'Campo inválido';
      case ValidationError.requiredField:
        return 'Campo obrigatório';
      case ValidationError.invalidEmail:
        return 'Email inválido';
      case ValidationError.noError:
        return '';
    }
  }

  @override
  Future<void> auth() async {
    print('Teste');
  }
}
