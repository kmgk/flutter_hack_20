import 'package:flutter/material.dart';
import 'package:flutter_hack20/model/ecoPost.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:flutter_hack20/sevice/firebase_auth_service.dart';
import 'package:flutter_hack20/sevice/firestore_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EcoPostPage extends StatefulWidget {
  const EcoPostPage({@required this.user});
  final User user;

  @override
  _EcoPostPageState createState() => _EcoPostPageState();
}

class _EcoPostPageState extends State<EcoPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {
              FirebaseAuthService.instance.signOut();
              Navigator.pop(context);
            }),
        title: const Text('New Eco Post'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('test form'),
            RaisedButton(
              child: const Text('post'),
              onPressed: () {
                FirestoreService.instance.createEcoPost(
                  EcoPost.forCreate(widget.user, 'test'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
