import 'package:flutter/material.dart';

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
        ],
      ),
    ),
  );
}
