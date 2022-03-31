import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<UserObj> streamUser(String id) {
    return _db
      .collection("users")
      .doc(id)
      .snapshots()
      .map((snap) => UserObj.fromMap(snap.data()));
  }

  Future<void> createUser(String id, Map<String, dynamic> data) {
    return _db.collection("users").doc(id).set(data);
  }

  // https://stackoverflow.com/questions/57877154/flutter-dart-how-can-check-if-a-document-exists-in-firestore
  Future<bool> checkIfUserExists(String id) async {
    try {
      final collectionRef = FirebaseFirestore.instance.collection("users");
      final doc = await collectionRef.doc(id).get();
      return doc.exists;
    } catch (e) {
      return false;
    }
  }
}