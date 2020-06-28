import 'package:flutter/material.dart';

import 'package:flutter_hack20/model/karmaPost.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:flutter_hack20/sevice/firestore_service.dart';

class KarmaPostPage extends StatefulWidget {
  const KarmaPostPage({@required this.user});
  final User user;

  @override
  _KarmaPostPageState createState() => _KarmaPostPageState();
}

class _KarmaPostPageState extends State<KarmaPostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String body = '';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.red,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('New Karma Post'),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  maxLines: null,
                  enabled: true,
                  maxLength: 100,
                  maxLengthEnforced: false,
                  obscureText: false,
                  autovalidate: false,
                  decoration: InputDecoration(
                    hintText: 'karma post',
                    labelText: 'post',
                    border: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                  ),
                  validator: (String value) {
                    return value.isEmpty ? 'karma post is required' : null;
                  },
                  onSaved: (String value) {
                    body = value;
                  },
                ),
                RaisedButton(
                    color: Colors.red,
                    onPressed: _submission,
                    child: const Text(
                      'post',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submission() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FirestoreService.instance.createKarmaPost(
        KarmaPost.forCreate(widget.user, body),
      );
      FirestoreService.instance.incrementUserKarmaPoint(widget.user);
      Navigator.pop(context);
    }
  }
}
