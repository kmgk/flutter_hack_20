import 'package:flutter/material.dart';
import 'package:flutter_hack20/model/user.dart';

const Map<String, Color> profileDeepColor = <String, Color>{
  'pink': Colors.pink,
  'indigo': Colors.indigo,
  'yellow': Colors.yellow,
  'green': Colors.green,
};

const Map<String, Color> profileLightColor = <String, Color>{
  'orange': Colors.orange,
  'blueAccent': Colors.blueAccent,
  'lime': Colors.lime,
  'lightGreen': Colors.lightGreen,
};

const List<String> deepColorList = <String>[
  'pink',
  'indigo',
  'yellow',
  'green',
];
const List<String> lightColorList = <String>[
  'orange',
  'blueAccent',
  'lime',
  'lightGreen',
];

Widget profileCircle(User user, double size) {
  return CircleAvatar(
    radius: size,
    backgroundColor: profileDeepColor[user.deepColorCode],
    child: Icon(
      Icons.spa,
      color: profileLightColor[user.lightColorCode],
      size: size,
    ),
  );
}
