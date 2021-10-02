import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

LoadUsers makeRemoteLoadUsers() => RemoteLoadUsers(
      cloudFirestore: makeFirebaseFirestoreAdapter(),
    );
