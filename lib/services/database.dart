import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection Reference

  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  final CollectionReference schoolCollection =
      Firestore.instance.collection('institutes');

  Future updateUserDate(String name, String email, String phone) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'phone': phone,
    });
  }

  //convert Query Snapshot to School List
  List<School> _schoolListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return School(
        name: doc.data['name'] ?? "Unknown",
        address: doc.data['address'] ?? "not present",
        contact: doc.data['contact'] ?? "no contact",
      );
    }).toList();
  }

  //convert Document Snapshot to User Data
  UserData _userDataFromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      phone: snapshot.data['phone'],
    );
  }

  // School Stream
  Stream<List<School>> get schools {
    return schoolCollection.snapshots().map(_schoolListfromSnapshot);
  }

  // User Data Stream

  Stream<UserData> get userData {
    return userCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromDocumentSnapshot);
  }
}
