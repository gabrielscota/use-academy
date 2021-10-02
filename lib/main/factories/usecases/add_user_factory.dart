import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

AddUser makeRemoteAddUser() => RemoteAddUser(
      cloudFirestore: makeFirebaseFirestoreAdapter(),
    );
