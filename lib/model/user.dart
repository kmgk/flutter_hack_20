import 'package:flutter/cupertino.dart';

class User {
  const User({
    @required this.uid,
    @required this.name,
    @required this.ecoPoint,
    @required this.karmaPoint,
    @required this.totalEcoPoint,
    @required this.totalKarmaPoint,
    @required this.createdAt,
  })  : assert(uid != null),
        assert(name != null),
        assert(ecoPoint != null),
        assert(karmaPoint != null),
        assert(totalEcoPoint != null),
        assert(totalKarmaPoint != null),
        assert(createdAt != null);

  factory User.initialized(String uid, String name) {
    return User(
      uid: uid,
      name: name,
      ecoPoint: 0,
      karmaPoint: 0,
      totalEcoPoint: 0,
      totalKarmaPoint: 0,
      createdAt: DateTime.now(),
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      name: map['name'] as String,
      ecoPoint: map['ecoPoint'] as int,
      karmaPoint: map['karmaPoint'] as int,
      totalEcoPoint: map['totalEcoPoint'] as int,
      totalKarmaPoint: map['totalKarmaPoint'] as int,
      createdAt: map['createdAt'].toDate() as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'ecoPoint': ecoPoint,
      'karmaPoint': karmaPoint,
      'totalEcoPoint': totalEcoPoint,
      'totalKarmaPoint': totalKarmaPoint,
      'createdAt': createdAt,
    };
  }

  final String uid;
  final String name;
  final int ecoPoint;
  final int karmaPoint;
  final int totalEcoPoint;
  final int totalKarmaPoint;
  final DateTime createdAt;
}
