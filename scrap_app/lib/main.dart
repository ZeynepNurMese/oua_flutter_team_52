import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'con_without_login_page.dart';
import 'pages/admin_pages/admin_nav_bar_page.dart';
import 'pages/scrap_dealer_pages/scrap_dealer_nav_bar_page.dart';
import 'pages/user_pages/user_nav_bar_page.dart';
import 'utilities/google_sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirebaseInitialized = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      isFirebaseInitialized = true;
    });
    await toCheckUserLoggedIn();
  }
  //This meth. checks users if they are already logged in and redirect them to their homepages.
  Future<void> toCheckUserLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.uid != null) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> userData =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userData['role'] == 'user') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ToUserHomePage()));
      } else if (userData['role'] == 'admin') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ToAdminHomePage()));
      } else if (userData['role'] == 'scrap_dealer') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ToScrapDealerHomePage()));
      }
    }
  }

  void runToUserHomePage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => ToUserHomePage(),
    ));
  }
  //
  // void runToAdminHomePage() {
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
  //     builder: (context) => ToAdminHomePage(),
  //   ));
  // }
  //
  // void runToScrapDealerHomePage() {
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
  //     builder: (context) => ToScrapDealerHomePage(),
  //   ));
  // }

  void continueWithoutLogin() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ContinueWithoutLoginPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child: isFirebaseInitialized
                ? ElevatedButton(
                    onPressed: () async {
                      await signInWithGoogle();
                      String? name = FirebaseAuth.instance.currentUser!.displayName;
                      String? email = FirebaseAuth.instance.currentUser!.email;
                      String uid = FirebaseAuth.instance.currentUser!.uid;
                      DocumentSnapshot<Map<String, dynamic>> toCheckUserData =
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(uid)
                              .get();
                      DocumentSnapshot<Map<String, dynamic>> toCheckUserExists =
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(uid)
                              .get();
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(uid)
                          .set({
                        'name': name,
                        'email': email,
                        'uid': uid,
                        if (toCheckUserExists.exists == false ||
                            toCheckUserData['role'] == 'user')
                          'role': 'user',
                        'isUserSignIn': true,
                        'lastLoginTime': FieldValue.serverTimestamp(),
                      }, SetOptions(merge: true));
                      toCheckUserLoggedIn();
                    },
                    child: Text('Sign in with Google'))
                : CircularProgressIndicator(),
          ),
          ElevatedButton(onPressed: () {
            continueWithoutLogin();
          }, child: Text('Continue Without Login'))
        ],
      ),
    );
  }
}
