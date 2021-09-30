import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/firebase/firebase.dart';
import '../../../infra/infra.dart';

FirebaseAuthentication makeFirebaseAuthenticationAdapter() => FirebaseAuthenticationAdapter(
      firebaseAuth: FirebaseAuth.instance,
    );
