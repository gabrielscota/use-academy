import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeLoginValidation() => ValidationComposite(
      validations: makeLoginValidations(),
    );

List<FieldValidation> makeLoginValidations() => [
      ...ValidationBuilder.field('email').required().email().build(),
      ...ValidationBuilder.field('password').required().min(6).build(),
      ...ValidationBuilder.field('passwordConfirmation').required().min(6).sameAs('password').build(),
    ];
