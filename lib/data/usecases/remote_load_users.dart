import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../firebase/firebase.dart';

class RemoteLoadUsers implements LoadUsers {
  final FirebaseCloudFirestore cloudFirestore;

  RemoteLoadUsers({
    required this.cloudFirestore,
  });

  @override
  Future<List<PersonEntity>> loadUsers() async {
    final CollectionReference collectionReference =
        await cloudFirestore.getCollectionReference(collectionPath: 'users');
    final QuerySnapshot response = await collectionReference.get();
    final List<PersonEntity> people = response.docs.map(
      (document) {
        final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return PersonEntity(
          id: document.id,
          name: (data['name'] ?? ''),
          age: (data['age'] ?? 0),
          height: double.parse((data['height'] ?? 0.0).toString()),
        );
      },
    ).toList();

    return people;
  }
}
