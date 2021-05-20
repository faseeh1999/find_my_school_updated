import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_my_school_updated/models/notification.dart';
import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/models/user.dart';

import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final _auth = FirebaseAuth.instance;

  final String sid; // for school id
  final String uid; // for user id
  DatabaseService({this.uid, this.sid});

  currentUser() async {
    FirebaseUser current = await FirebaseAuth.instance.currentUser();
    return current.uid;
  }

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

  // Alert Collection Reference

  // final CollectionReference alertCollection =
  //     Firestore.instance.collection('users').document().collection('alerts');

  Future updateUserDate(String name, String email, String phone) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'phone': phone,
    });
  }

  // Function to Check the Bookmark from the firestore.
  Future checkBookmark(School bookmark) async {
    if (await userCollection
        .document(uid)
        .collection('bookmarks')
        .getDocuments()
        .then((value) => value.documents.isEmpty)) {
      return false;
    } else {
      bool bookmarkPresent = await userCollection
          .document(uid)
          .collection('bookmarks')
          .getDocuments()
          .then((value) {
        if (value.documents
            .any((element) => element.data.containsValue(bookmark.name))) {
          return true;
        } else {
          return false;
        }
      });
      return bookmarkPresent;
    }
  }

// Function to Add the Bookmark to the firestore.
  Future addBookmark(School bookmark) async {
    return await userCollection.document(uid).collection('bookmarks').add({
      "name": bookmark.name ?? "Unknown",
      "address": bookmark.address ?? "not present",
      "contact": bookmark.contact ?? "no contact",
      "image": bookmark.image ?? "",
      "bg": bookmark.bg ?? "",
      "sector": bookmark.sector ?? "",
      "category": bookmark.category ?? "",
      "openingtiming": bookmark.openingtiming ?? "",
      "normaltiming": bookmark.normaltiming ?? "",
      "fridaytiming": bookmark.fridaytiming ?? "",
      "webUrl": bookmark.webUrl ?? "",
      "location": bookmark.location ?? "",
      "city": bookmark.city ?? "",
      "province": bookmark.province ?? "",
      "lowerfeerange": bookmark.lowerfeerange ?? 2000,
      "upperfeerange": bookmark.upperfeerange ?? 7000,
      "feedetails": bookmark.feedetails ?? "",
      "curriculum": bookmark.curriculum ?? "",
      "rating": bookmark.rating ?? 1.0
    });
  }

  // Function to Remove the Bookmark from the firestore.
  Future removeBookmark(School bookmark) async {
    String bookmarkID = await userCollection
        .document(uid)
        .collection('bookmarks')
        .limit(1)
        .getDocuments()
        .then((value) => value.documents.first.documentID);

    return await userCollection
        .document(uid)
        .collection('bookmarks')
        .document(bookmarkID)
        .delete();
  }

  // Function to Remove the Notification in FireStore.
  Future removeNotification() async {
    var alertID = await userCollection
        .document(uid)
        .collection('alerts')
        .limit(1)
        .getDocuments()
        .then((value) => value.documents.first.documentID);

    return await userCollection
        .document(uid)
        .collection('alerts')
        .document(alertID)
        .delete();
  }

  //convert Query Snapshot to School List
  List<School> _schoolListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return School(
          name: doc.data['name'] ?? "Unknown",
          address: doc.data['address'] ?? "not present",
          contact: doc.data['contactnumber'] ?? "no contact",
          image: doc.data['image'] ?? "",
          bg: doc.data['bg'] ?? "",
          sector: doc.data['sector'] ?? "",
          category: doc.data['category'] ?? "",
          openingtiming: doc.data['openingtiming'] ?? "",
          normaltiming: doc.data['normaltiming'] ?? "",
          fridaytiming: doc.data['fridaytiming'] ?? "",
          webUrl: doc.data['webUrl'] ?? "",
          location: doc.data['location'] ?? "",
          city: doc.data['city'] ?? "",
          province: doc.data['province'] ?? "",
          lowerfeerange: doc.data['lowerfeerange'] ?? 2000,
          upperfeerange: doc.data['upperfeerange'] ?? 7000,
          feedetails: doc.data['feedetails'] ?? "",
          curriculum: doc.data['curriculum'] ?? "",
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
  // Stream<List<Notifications>> get notification {
  //   return notificationCollection
  //       .snapshots()
  //       .map(_notificationListfromSnapshot);
  // }

  //convert Query Snapshot to Notifications List
  List<Notifications> _notificationListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Notifications(
        title: doc.data['title'],
        message: doc.data['message'],
      );
    }).toList();
  }

  // Bookmarks Stream
  Stream<List<School>> get bookmarks {
    return userCollection
        .document(uid)
        .collection('bookmarks')
        .snapshots()
        .map(_schoolListfromSnapshot);
  }

  // User Data Stream

  Stream<UserData> get userData {
    return userCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromDocumentSnapshot);
  }

  // Alert Stream
  Stream<List<Notifications>> get alerts {
    return userCollection
        .document(uid)
        .collection('alerts')
        .snapshots()
        .map(_notificationListfromSnapshot);
  }
}
