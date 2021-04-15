import 'package:Instagramclone/loginPage.dart';
import 'package:Instagramclone/tabPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return TabPage(snapshot.data);
        } else {
          return LoginPage();
        }
      },
    );
  }
}
