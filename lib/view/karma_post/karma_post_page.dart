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
    return Scaffold(
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
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  hintText: 'karma post',
                  labelText: 'post',
                  labelStyle: const TextStyle(color: Colors.red),
                  border: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderRadius: BorderRadius.circular(1.5),
                  ),
                  fillColor: Colors.red,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
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
    );
  }

  void _submission() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FirestoreService.instance.createKarmaPost(
        KarmaPost.forCreate(widget.user, body),
      );
      Navigator.pop(context);
    }
  }
}
