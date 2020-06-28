import 'package:flutter/material.dart';
import 'package:flutter_hack20/sevice/firebase_auth_service.dart';

AppBar commonAppBar(String title, {Color color}) {
  return AppBar(
    leading: IconButton(
        icon: Icon(Icons.ac_unit),
        onPressed: () {
          FirebaseAuthService.instance.signOut();
        }),
    title: Text(
      title,
      style: const TextStyle(color: Colors.white ?? Colors.black),
    ),
    backgroundColor: color ?? Colors.white,
    centerTitle: true,
    elevation: 0,
  );
}
