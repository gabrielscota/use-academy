import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/firebase/firebase.dart';
import '../../../infra/infra.dart';

FirebaseCloudFirestore makeFirebaseAuthenticationAdapter() => FirebaseCloudFirestoreAdapter(
      firebaseFirestore: FirebaseFirestore.instance,
    );
