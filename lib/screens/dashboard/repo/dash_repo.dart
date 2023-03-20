import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zineapp2023/api.dart';
import '../../../models/events.dart';

class DashRepo {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  dynamic getEvents() async {
    print('get events called');
    var querySnapshot =
        await FirebaseFirestore.instance.collection("events").get();
    final _docData = querySnapshot.docs.map((doc) => Events.store(doc));
    return _docData.toList();
  }

  Future<void> launchUrlStart({required String url}) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
