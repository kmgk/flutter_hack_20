import 'package:flutter/material.dart';
import 'package:flutter_hack20/sevice/firebase_auth_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage();
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _controller = TextEditingController();
  String _name = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                Text(
                  'Welcome to Ecomy!',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            TextFormField(
              controller: _controller,
              onChanged: (String t) => setState(() => _name = t),
              validator: (String t) => 'aaa',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
                labelText: 'name',
              ),
            ),
            RaisedButton(
              child: const Text(
                'sign up',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              onPressed: _name == null || _name == ''
                  ? null
                  : () async {
                      setState(() => _isLoading = true);
                      await FirebaseAuthService.instance
                          .signInAnonymously(_name);
                    },
            ),
          ],
        ),
      ),
    );
  }
}
