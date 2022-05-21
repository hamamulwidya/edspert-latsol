import 'package:firebase_auth/firebase_auth.dart';

class UserEmail {
  static String? getUserEmail() {
    final user = FirebaseAuth.instance.currentUser;
    return user?.email;
  }

  static String? getUserDisplayName() {
    final user = FirebaseAuth.instance.currentUser;
    return user?.displayName;
  }

  static String? getUserPhotoUrl() {
    final user = FirebaseAuth.instance.currentUser;
    return user?.photoURL;
  }
}
