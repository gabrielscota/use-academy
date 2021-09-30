import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';
import '../pages.dart';

LoginPresenter makeGetxLoginPresenter() => GetxLoginPresenter(
      firebaseAuthentication: makeFirebaseAuthenticationAdapter(),
      validation: makeLoginValidation(),
    );
