import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_my_school_updated/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection Reference

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserDate(String name, String email, String phone) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'phone': phone,
    });
  }

  // //convert Query Snapshot to Brew List
  // List<Brew> _brewListfromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return Brew(
  //       name: doc.data['name'] ?? "",
  //       sugars: doc.data['sugars'] ?? "0",
  //       strength: doc.data['strength'] ?? 0,
  //     );
  //   }).toList();
  // }

  //convert Document Snapshot to User Data
  UserData _userDataFromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      phone: snapshot.data['phone'],
    );
  }

  // // Brews Stream
  // Stream<List<Brew>> get brews {
  //   return brewCollection.snapshots().map(_brewListfromSnapshot);
  // }

  // User Data Stream

  Stream<UserData> get userData {
    return userCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromDocumentSnapshot);
  }
}
