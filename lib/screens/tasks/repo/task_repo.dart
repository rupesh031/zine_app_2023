import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/retry.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zineapp2023/api.dart';
import 'package:zineapp2023/models/userTask.dart';
import '../../../models/tasks.dart';

class TaskRepo {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  dynamic getTasks(uid) async {
    var query = await _firebaseFirestore
        .collection("userTasks")
        .where("users", arrayContains: _firebaseFirestore.doc("/users/${uid}"));
    var data = await query.get();
    final docData = data.docs.map((doc) => UserTask.store(doc));
    return docData.toList();
  }

  dynamic getDocRef(ref) async {
    var doc = await _firebaseFirestore.doc(ref).get();
    Tasks docData = Tasks.store(doc);
    print(docData.title);
    return docData;
  }
}
