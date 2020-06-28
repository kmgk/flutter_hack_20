import 'package:flutter/material.dart';
import 'package:flutter_hack20/model/ecoPost.dart';
import 'package:flutter_hack20/model/karmaPost.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:flutter_hack20/sevice/firestore_service.dart';

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
                onPressed: () async {
                  await FirestoreService.instance.incrementUserEcoPoint(user);
                  await FirestoreService.instance.incrementEcoCount(ecoPost);
                },
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
                onPressed: () async {
                  await FirestoreService.instance.incrementUserKarmaPoint(user);
                  await FirestoreService.instance.incrementKarmaCount(
                    karmaPost,
                  );
                },
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
  final int karmaPoint = user.totalKarmaPoint - user.totalEcoPoint < 0
      ? 0
      : user.totalKarmaPoint - user.totalEcoPoint;
  return ListTile(
    leading: const CircleAvatar(
      child: Icon(
        Icons.spa,
        color: Colors.greenAccent,
      ),
    ),
    title: Row(
      children: <Widget>[
        Text(user.name),
        const SizedBox(width: 10),
        const Icon(Icons.spa, color: Colors.green),
        Text(
          user.totalEcoPoint.toString(),
          style: const TextStyle(color: Colors.green),
        ),
        const Icon(Icons.whatshot, color: Colors.red),
        Text(
          karmaPoint.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      ],
    ),
  );
}
