import 'package:flutter/cupertino.dart';
import 'package:flutter_hack20/model/user.dart';

class EcoPost {
  const EcoPost({
    @required this.uid,
    @required this.user,
    @required this.body,
    @required this.ecoCount,
    @required this.createdAt,
  })  : assert(uid != null),
        assert(user != null),
        assert(body != null),
        assert(ecoCount != null),
        assert(createdAt != null);

  factory EcoPost.forCreate(User user, String body) {
    return EcoPost(
      uid: '',
      user: user,
      body: body,
      ecoCount: 0,
      createdAt: DateTime.now(),
    );
  }

  factory EcoPost.fromMap(Map<String, dynamic> map) {
    return EcoPost(
      uid: map['uid'] as String,
      user: map['user'] as User,
      body: map['body'] as String,
      ecoCount: map['ecoCount'] as int,
      createdAt: map['createdAt'] as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userId': user.uid,
      'body': body,
      'ecoCount': ecoCount,
      'createdAt': createdAt,
    };
  }

  EcoPost copyWith({
    String uid,
    User user,
    String body,
    int ecoCount,
  }) {
    return EcoPost(
      uid: uid ?? this.uid,
      user: user ?? this.user,
      body: body ?? this.body,
      ecoCount: ecoCount ?? this.ecoCount,
      createdAt: createdAt,
    );
  }

  final String uid;
  final User user;
  final String body;
  final int ecoCount;
  final DateTime createdAt;
}

/// firestoreから読み取ったデータを直接入れるやつ。EcoPostの中間的な役割
class EcoPostJson {
  const EcoPostJson({
    @required this.uid,
    @required this.userId,
    @required this.body,
    @required this.ecoCount,
    @required this.createdAt,
  })  : assert(uid != null),
        assert(userId != null),
        assert(body != null),
        assert(ecoCount != null),
        assert(createdAt != null);

  factory EcoPostJson.fromMap(Map<String, dynamic> map) {
    return EcoPostJson(
      uid: map['uid'] as String,
      userId: map['userId'] as String,
      body: map['body'] as String,
      ecoCount: map['ecoCount'] as int,
      createdAt: map['createdAt'].toDate() as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userId': userId,
      'body': body,
      'ecoCount': ecoCount,
      'createdAt': createdAt,
    };
  }

  final String uid;
  final String userId;
  final String body;
  final int ecoCount;
  final DateTime createdAt;
}
