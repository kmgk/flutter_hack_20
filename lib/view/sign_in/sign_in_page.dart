import 'package:flutter/material.dart';

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
            // TODO: anonymously sign-in
          },
        ),
      ),
    );
  }
}
