import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseCloudFirestore {
  Future<CollectionReference> getCollectionReference({required String collectionPath});
}
