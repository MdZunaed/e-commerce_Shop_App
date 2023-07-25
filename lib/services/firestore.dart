import 'package:velvethue/services/firebase.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore.collection(users).where('id', isEqualTo: uid).snapshots();
  }
}
