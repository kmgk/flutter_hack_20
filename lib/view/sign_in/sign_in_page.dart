import 'package:flutter/material.dart';
import 'package:flutter_hack20/sevice/firebase_auth_service.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _name = 'Enter your name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 100.0),
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
            const SizedBox(height: 40.0),
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
            const SizedBox(height: 57.0),
            // TextField(
            //   decoration: InputDecoration(
            //     border: const OutlineInputBorder(),
            //     hintText: 'your name',
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Enter your name'),
                  keyboardAppearance: Brightness.light,
                  initialValue: _name,
                  validator: (String value) =>
                      value.isNotEmpty ? null : 'you can`t save name',
                  onSaved: (String value) {
                    _name = value;
                    print(value);
                  }),
            ),
            const SizedBox(height: 80.0),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: RaisedButton(
                  child: const Text('sign up'),
                  onPressed: () async {
                    print(_name);
                    await FirebaseAuthService.instance.signInAnonymously(_name);
                  },
                  color: Colors.greenAccent,
                  textColor: Colors.white),
            ),
          ]),
    );
  }
}
