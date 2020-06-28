import 'package:flutter/material.dart';
import 'package:flutter_hack20/sevice/firebase_auth_service.dart';

class SignInPage extends StatelessWidget {
  // const SignInPage();
  String _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 100.0),
            Center(
              child: Text(
                'ecomy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Center(
              child: Text(
                'What is name ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 57.0),
            // TextField(
            //   decoration: InputDecoration(
            //     border: const OutlineInputBorder(),
            //     hintText: 'your name',
            //   ),
            // ),
            TextFormField(
              decoration: InputDecoration(labelText: 'your name'),
              keyboardAppearance: Brightness.light,
              initialValue: _name,
              validator: (value) => value.isNotEmpty ? null : 'you can`t save name',
              onSaved: (value) => _name = value,
            ),
            SizedBox(height: 80.0),
            RaisedButton(
              child: const Text('sign up'),
              onPressed: () async {
                await FirebaseAuthService.instance.signInAnonymously(_name);
              },
            ),
          ]),
    );
  }
}
