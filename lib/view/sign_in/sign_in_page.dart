import 'package:flutter/material.dart';
import 'package:flutter_hack20/sevice/firebase_auth_service.dart';

class SignInPage extends StatelessWidget {
  const SignInPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sign up'),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('sign up'),
          onPressed: () async {
            const String name = 'ここに名前が入る';
            await FirebaseAuthService.instance.signInAnonymously(name);
          },
        ),
      ),
    );
  }
}
