import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/firebase/firebase.dart';

class FirebaseCloudFirestoreAdapter implements FirebaseCloudFirestore {
  final FirebaseFirestore firebaseFirestore;

  FirebaseCloudFirestoreAdapter({
    required this.firebaseFirestore,
  });

  @override
  Future<CollectionReference> getCollectionReference({required String collectionPath}) async {
    CollectionReference reference = firebaseFirestore.collection(collectionPath);
    return reference;
  }
}
