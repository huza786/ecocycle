import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycle_app/Models/message.dart';
import 'package:recycle_app/View/postcode_form/viewmodel/userid_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseMessaging {
  Future<void> sendMessage(String message) async {
    const String adminId = "422f8060-2087-4e86-9e2b-db49e10eaf04";
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final messaging = Message(
        isAdmin: false,
        recieverId: adminId,
        message: message,
        timestamp: Timestamp.now(),
        dateTime: DateTime.now());

    final list = [adminId, prefs.getString("userid")];
    list.sort();
    final roomName = list.join("_");
    firestore
        .collection("chat_rooms")
        .doc(roomName)
        .collection('messages')
        .add(messaging.toMap());
    await getids(roomName);
  }

  Future<void> sendAdminMessage(String userId) async {
    const String adminId = "422f8060-2087-4e86-9e2b-db49e10eaf04";
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final messaging = Message(
        isAdmin: true,
        recieverId: adminId,
        message: "Welcome to Ecocycle",
        timestamp: Timestamp.now(),
        dateTime: DateTime.now());

    final list = [adminId, userId];
    list.sort();
    final roomName = list.join("_");
    firestore
        .collection("chat_rooms")
        .doc(roomName)
        .collection('messages')
        .add(messaging.toMap());
    await getids(roomName);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatStream(String userId) {
    const String adminId = "422f8060-2087-4e86-9e2b-db49e10eaf04";
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    debugPrint(userId);
    final list = [adminId, userId];
    list.sort();
    final roomName = list.join("_");
    return firebaseFirestore
        .collection("chat_rooms")
        .doc(roomName)
        .collection('messages')
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  // Stream<QuerySnapshot> messageStream() async {
  //   const String adminId = "422f8060-2087-4e86-9e2b-db49e10eaf04";
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final list = [adminId, prefs.getString("userid")];
  //   list.sort();
  //   final roomName = list.join("_");
  //   return firestore
  //       .collection("chat_rooms")
  //       .doc(roomName)
  //       .collection('messages')
  //       .orderBy("timestamp", descending: true);
  // }
  Future<void> getids(String sendingid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final listdoc =
        await firebaseFirestore.collection("chat_room_ids").doc("list").get();
    final listmap = listdoc.data();
    List<String> list = List<String>.from(listmap!['list'] as List<dynamic>);
    debugPrint(list.toString());

    List<String> newList = [];
    newList.addAll(list); // Create a copy of the list

    if (!newList.contains(sendingid)) {
      newList.add(sendingid);
      debugPrint(newList.toString());

      await firebaseFirestore
          .collection('chat_room_ids')
          .doc("list")
          .set({"list": newList});
    } else {
      debugPrint("already Contains id");
      // Handle the case where sendingid matches id
      return;
    }
  }
}

final messageStream = StreamProvider(
  (ref) {
    const String adminId = "422f8060-2087-4e86-9e2b-db49e10eaf04";
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final userId = ref.read(userIdProvider);
    debugPrint(userId);
    final list = [adminId, userId];
    list.sort();
    final roomName = list.join("_");
    return firebaseFirestore
        .collection("chat_rooms")
        .doc(roomName)
        .collection('messages')
        .orderBy("timestamp", descending: false)
        .snapshots();
  },
);
