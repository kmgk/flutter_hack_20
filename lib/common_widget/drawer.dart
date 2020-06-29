import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Drawer drawer(BuildContext context) {
  return Drawer(
    child: Ink(
      color: Colors.green[100],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset('assets/logo.png'),
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
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
          )
        ],
      ),
    ),
  );
}
