import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  User user;
  Home(this.user);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            child: Column(
              children: <Widget>[
                Text(
                  "Hello ${user.displayName}",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Container(
                    color: Colors.grey,
                    width: 1000,
                    height: 300
                ),
                Container(
                  width: 1000,
                  height: 300,
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: new Text('新規作成'),),
                      RaisedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: new Text('英単語'),),
                      RaisedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: new Text('IT用語'),),
                      RaisedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: new Text('メニューリスト'),)
                    ],
                  ),
                ),
                // new TextField(
                //   enabled: true,
                //   // 入力数
                //   maxLength: 10,
                //   maxLengthEnforced: false,
                //   style: TextStyle(color: Colors.red),
                //   obscureText: false,
                //   maxLines:1 ,
                //   //パスワード
                // ),
                RaisedButton(onPressed: () => Navigator.of(context).pop(),
                  child: new Text('戻る'),)
              ],
            )
        )
    );
  }
}