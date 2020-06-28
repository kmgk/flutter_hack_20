import 'package:flutter/material.dart';
import 'package:flutter_hack20/sevice/firebase_auth_service.dart';

AppBar commonAppBar(String title, {Color color}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(color: Colors.white ?? Colors.black),
    ),
    backgroundColor: color ?? Colors.white,
    centerTitle: true,
    elevation: 0,
    actions: <Widget>[
      FlatButton(
        onPressed: () => FirebaseAuthService.instance.signOut(),
        child: const Text(
          'SignOut',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
