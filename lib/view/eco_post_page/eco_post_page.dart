import 'package:flutter/material.dart';

import 'package:flutter_hack20/model/ecoPost.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:flutter_hack20/sevice/firestore_service.dart';

class EcoPostPage extends StatefulWidget {
  const EcoPostPage({@required this.user});
  final User user;

  @override
  _EcoPostPageState createState() => _EcoPostPageState();
}

class _EcoPostPageState extends State<EcoPostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String body = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Eco Post'),
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
                    hintText: 'eco post',
                    labelText: 'post',
                    border: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(1.5))),
                validator: (String value) {
                  return value.isEmpty ? 'eco post is required' : null;
                },
                onSaved: (String value) {
                  body = value;
                },
              ),
              RaisedButton(
                  color: Colors.green,
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
      FirestoreService.instance.createEcoPost(
        EcoPost.forCreate(widget.user, body),
      );
      FirestoreService.instance.incrementUserEcoPoint(widget.user);
      Navigator.pop(context);
    }
  }
}
