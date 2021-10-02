import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../firebase/firebase.dart';
import '../models/models.dart';

class RemoteAddUser implements AddUser {
  final FirebaseCloudFirestore cloudFirestore;

  RemoteAddUser({
    required this.cloudFirestore,
  });

  @override
  Future<void> addUser({required PersonEntity user}) async {
    final CollectionReference collectionReference =
        await cloudFirestore.getCollectionReference(collectionPath: 'users');
    collectionReference.add(RemotePersonModel.fromEntity(user).toJson());
  }
}
