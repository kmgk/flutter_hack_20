import 'package:flutter/material.dart';
import 'package:flutter_hack20/model/ecoPost.dart';
import 'package:flutter_hack20/model/karmaPost.dart';
import 'package:flutter_hack20/model/user.dart';

Widget ecoPostCard(User user, EcoPost ecoPost) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _userListTile(user),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(ecoPost.body),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.nature,
                  color: Colors.green,
                ),
                onPressed: () {},
              ),
              Text(
                '${ecoPost.ecoCount}',
                style: const TextStyle(color: Colors.green),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget karmaPostCard(User user, KarmaPost karmaPost) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _userListTile(user),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(karmaPost.body),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.whatshot,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              Text(
                '${karmaPost.karmaCount}',
                style: const TextStyle(color: Colors.red),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget _userListTile(User user) {
  return ListTile(
    leading: const CircleAvatar(
      child: Icon(
        Icons.spa,
        color: Colors.greenAccent,
      ),
    ),
    title: Text(user.name),
    trailing: RichText(
      text: TextSpan(
        text: '\u{1f331}${user.totalEcoPoint}  ',
        style: const TextStyle(color: Colors.green),
        children: <TextSpan>[
          TextSpan(
            text: '\u{1f525}${user.karmaPoint}',
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    ),
  );
}
