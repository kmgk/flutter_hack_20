import 'package:flutter/cupertino.dart';

class User {
  const User({
    @required this.uid,
    @required this.name,
    @required this.deepColorCode,
    @required this.lightColorCode,
    @required this.ecoPoint,
    @required this.karmaPoint,
    @required this.createdAt,
  })  : assert(uid != null),
        assert(name != null),
        assert(deepColorCode != null),
        assert(lightColorCode != null),
        assert(ecoPoint != null),
        assert(karmaPoint != null),
        assert(createdAt != null);

  factory User.initialized(
    String uid,
    String name,
  ) {
    return User(
      uid: uid,
      name: name,
      deepColorCode: '',
      lightColorCode: '',
      ecoPoint: 0,
      karmaPoint: 0,
      createdAt: DateTime.now(),
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      name: map['name'] as String,
      deepColorCode: map['deepColorCode'] as String,
      lightColorCode: map['lightColorCode'] as String,
      ecoPoint: map['ecoPoint'] as int,
      karmaPoint: map['karmaPoint'] as int,
      createdAt: map['createdAt'].toDate() as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'deepColorCode': deepColorCode,
      'lightColorCode': lightColorCode,
      'ecoPoint': ecoPoint,
      'karmaPoint': karmaPoint,
      'createdAt': createdAt,
    };
  }

  User copyWith({
    String uid,
    String name,
    String deepColorCode,
    String lightColorCode,
    int ecoPoint,
    int karmaPoint,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      deepColorCode: deepColorCode ?? this.deepColorCode,
      lightColorCode: lightColorCode ?? this.lightColorCode,
      ecoPoint: ecoPoint ?? this.ecoPoint,
      karmaPoint: karmaPoint ?? this.karmaPoint,
      createdAt: createdAt,
    );
  }

  final String uid;
  final String name;
  final String deepColorCode;
  final String lightColorCode;
  final int ecoPoint;
  final int karmaPoint;
  final DateTime createdAt;
}
