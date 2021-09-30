import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../pages.dart';

LoginPresenter makeGetxLoginPresenter() => GetxLoginPresenter(validation: makeLoginValidation());
