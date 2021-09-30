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

  @override
  Future<void> auth() async {}
}
