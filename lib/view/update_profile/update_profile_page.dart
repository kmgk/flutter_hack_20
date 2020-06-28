import 'package:flutter/material.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:flutter_hack20/sevice/firestore_service.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({@required this.user});
  final User user;

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          const SizedBox(height: 100.0),
          const CircleAvatar(
            //ここをクリックした時に更新するメソッドを作る。
            // backgroundImage: ,
            child: Icon(
              Icons.spa,
              color: Colors.greenAccent,
              size: 60.0,
            ),
            radius: 60.0,
            // backgroundColor: Colors.greenAccent,
          ),
          const SizedBox(height: 30.0),
          Center(
            child: Text(
              'name: ${widget.user.name}',
              style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 30.0),
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    maxLines: null,
                    enabled: true,
                    maxLength: 20,
                    maxLengthEnforced: false,
                    obscureText: false,
                    autovalidate: false,
                    decoration: InputDecoration(
                        hintText: 'new user name',
                        labelText: 'rename your name',
                        border: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(1.5))),
                    validator: (String value) {
                      return value.isEmpty ? 'eco post is required' : null;
                    },
                    onSaved: (String value) {
                      name = value;
                      widget.user.copyWith(name: name);
                      print(widget.user.name);
                    },
                  ),
                  RaisedButton(
                      color: Colors.green,
                      onPressed: _submission,
                      child: const Text(
                        'submit',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          )
        ]));
  }

  void _submission() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FirestoreService.instance.updateUser(widget.user);
      Navigator.pop(context);
    }
  }
}
