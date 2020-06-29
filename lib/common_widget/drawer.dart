import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

Drawer drawer(BuildContext context) {
  final List<Widget> _childen = <Widget>[
    DrawerHeader(
      child: Image.asset('assets/logo.png'),
    ),
    ListTile(
      title: const Text('About'),
      onTap: () => Navigator.pushNamed(context, '/about'),
    ),
    ListTile(
      title: const Text('Github'),
      trailing: const Icon(Icons.launch),
      onTap: () {
        launch('https://github.com/kmgk/flutter_hack_20');
      },
    ),
    ListTile(
      title: const Text('Promotional Video (YouTube)'),
      trailing: const Icon(Icons.launch),
      onTap: () {
        launch('https://www.youtube.com/watch?v=ZePwm99YHn4');
      },
    ),
  ];

  if (Provider.of<FirebaseUser>(context) != null) {
    _childen.insert(
      2,
      ListTile(
        title: const Text('Ranking (β)'),
        onTap: () => Navigator.pushNamed(context, '/ranking'),
      ),
    );
  }

  return Drawer(
    child: Ink(
      color: Colors.green[100],
      child: ListView(
        padding: EdgeInsets.zero,
        children: _childen,
      ),
    ),
  );
}
