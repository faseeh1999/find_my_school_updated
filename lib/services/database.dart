import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_my_school_updated/models/notification.dart';
import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/models/user.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  final _auth = FirebaseAuth.instance;
  final String sid; // for school id
  final String uid; // for user id
  DatabaseService({this.uid, this.sid});

  // Collection References

// User Collection Reference

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  // School Collection Reference
  final CollectionReference schoolCollection =
      Firestore.instance.collection('institutes');

  // Notification Collection Reference
  final CollectionReference notificationCollection =
      Firestore.instance.collection('notifications');

  Future updateUserDate(String name, String email, String phone) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'phone': phone,
    });
  }

  // Function to Add the Institute Id to User Bookmarks Array Object in FireStore.
  Future addBookmark(String sid) async {
    return await userCollection.document(uid).updateData({'bookmarks': sid});
  }

  // Function to Remove the Institute Id to User Bookmarks Array Object in FireStore.
  Future removeBookmark(String sid) async {
    return await userCollection.document(uid);
  }

  //convert Query Snapshot to School List
  List<School> _schoolListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return School(
          sid: sid,
          name: doc.data['name'] ?? "Unknown",
          address: doc.data['address'] ?? "not present",
          contact: doc.data['contactnumber'] ?? "no contact",
          image: doc.data['image'] ?? "",
          rating: doc.data['rating'] ?? 1.0);
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

// Notifications  Stream
  Stream<List<Notifications>> get notification {
    return notificationCollection
        .snapshots()
        .map(_notificationListfromSnapshot);
  }

  //convert Query Snapshot to Notifications List
  List<Notifications> _notificationListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Notifications(
        text: doc.data['text'],
      );
    }).toList();
  }

  // // Bookmarks Stream
  // Stream<List<School>> get bookmarks {
  //   return userCollection
  //       .document(uid)
  //       .snapshots()
  //       .map(_schoolListfromSnapshot);
  // }

  // User Data Stream

  Stream<UserData> get userData {
    return userCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromDocumentSnapshot);
  }
}
