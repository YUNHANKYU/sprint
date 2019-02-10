import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class FirebaseAuthentication {
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> signIn() async {
    print("[click GOOGLE SIGN IN button]");
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    if (await checkAuth(currentUser)) {
      signUp(currentUser);
    } else {
      updateLastSignIn(currentUser);
    }

    print("User Name : ${user.displayName}");
    return currentUser;
  }

  Future<bool> checkAuth(FirebaseUser user) async {
    var docSnap = await Firestore.instance
        .document('users/${user.uid}')
        .get()
        .catchError((error) {
      print("[LoginIcon] Firestore.instance.document().get()");
      print(error);
    });

    print("resources firebase user checked");
    return docSnap.exists;
  }

  Future<FirebaseUser> getFirebaseUser() {
    print("getFirebaseUser");
    return _auth.currentUser();
  }

  void signOut() {
    print("[click LOGOUT button]");
    _googleSignIn.signOut();
    _auth.signOut();
  }

  void signUp(FirebaseUser user) {
    Firestore.instance.collection('users').document('${user.uid}').setData({
      "email": user.email,
      "goalAdded": true,
      "password": '33333',
      "lastLoginData": DateTime.now(),
    });
  }

  void updateLastSignIn(FirebaseUser user) {
    print("docsnap.data != null");
    // update the last Login Date when signed user start app.
    Firestore.instance.document('users/${user.uid}').updateData({
      'lastLoginDate': new DateTime.now(),
    });
  }
}
