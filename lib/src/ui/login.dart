import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../blocs/bloc_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    print("[click GOOGLE SIGN IN button]");
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    FirebaseUser user = await _auth.signInWithCredential(credential);

    Firestore.instance.document('users/${user.uid}').get().then((docSnap) {
      if (docSnap.data == null) {
        print("docsnap.data == null");
        print("users id : ${user.uid}");
        print("users email : ${user.email}");
        print("users passward : ${user.displayName}");
        Firestore.instance.collection('users').document('${user.uid}').setData({
          "email" : user.email,
          "goalAdded" : true,
          "password" : '33333',
          "lastLoginDate" : DateTime.now(),
        });
        BlocProvider.of(context).authBloc.setLoggedIn(true);
      } else {
        print("docsnap.data != null");
        // update the last Login Date when signed user start app.
        Firestore.instance.document('users/${user.uid}').updateData({
          'lastLoginDate': new DateTime.now(),
        });
        BlocProvider.of(context).authBloc.setLoggedIn(true);
      }
    }).catchError((error) {
      print("[LoginIcon] Firestore.instance.document().get()");
      print(error);
    });

    print("User Name : ${user.displayName}");
    return user;
  }

  _logout() {
    print("[click LOGOUT button]");
    _googleSignIn.signOut();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          // signin button
          onPressed: () => _signIn(),
//              BlocProvider.of(context)
//              .authBloc
//              .setLoggedIn(true),
          child: Text("Google Sign In"),
          color: Colors.green,
        ),
      ],
    );
  }
}
