import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scrum_minutes_02/logout.dart';

import 'home.dart';

class Login extends StatelessWidget {
  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  @override
  Widget build(BuildContext context) {
    void _handlePressed() {
      Navigator.of(context).pushNamed("/Home");
    }
    _onPressed() async {
      GoogleSignInAccount? signinAccount = await googleLogin.signIn();
      print(signinAccount);
      if (signinAccount == null) return;
      GoogleSignInAuthentication auth = await signinAccount.authentication;
      print(auth);
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );
      print(credential);
      User? user = (await FirebaseAuth.instance.signInWithCredential(
          credential)).user;
      if (user != null) {
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return Home(user);
          }),
        );
      }
    }
    return Scaffold(
        body: new Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: <Widget>[
                Image.asset('images/natsui01.png'),
                Text(
                  "ログインページ",
                  style: TextStyle(
                      color:Colors.blueAccent,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                FlatButton(
                  minWidth: 300.0,
                  onPressed: _onPressed,
                  color: Colors.blue,
                  child: Text(
                    'Googleでログイン',
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0
                    ),
                  ),
                ),
                FlatButton(
                  minWidth: 300.0,
                  onPressed: _handlePressed,
                  color: Colors.blue,
                  child: Text(
                    'Facebookでログイン',
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0
                    ),
                  ),
                ),
                FlatButton(
                  minWidth: 300.0,
                  onPressed: _handlePressed,
                  color: Colors.blue,
                  child: Text(
                    'Twitterでログイン',
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0
                    ),
                  ),
                ),
                FlatButton(
                  minWidth: 300.0,
                  onPressed: _handlePressed,
                  color: Colors.blue,
                  child: Text(
                    'hogehogeでログイン',
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}
