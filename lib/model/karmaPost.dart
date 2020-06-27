import 'package:flutter/cupertino.dart';
import 'package:flutter_hack20/model/user.dart';

class KarmaPost {
  const KarmaPost({
    @required this.uid,
    @required this.user,
    @required this.body,
    @required this.karmaCount,
    @required this.createdAt,
  })  : assert(uid != null),
        assert(user != null),
        assert(body != null),
        assert(karmaCount != null),
        assert(createdAt != null);

  factory KarmaPost.forCreate(User user) {
    return KarmaPost(
      uid: '',
      user: user,
      body: '',
      karmaCount: 0,
      createdAt: DateTime.now(),
    );
  }

  factory KarmaPost.fromMap(Map<String, dynamic> map) {
    return KarmaPost(
      uid: map['uid'] as String,
      user: map['user'] as User,
      body: map['body'] as String,
      karmaCount: map['karmaCount'] as int,
      createdAt: map['createdAt'] as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userId': user.uid,
      'body': body,
      'karmaCount': karmaCount,
      'createdAt': createdAt,
    };
  }

  final String uid;
  final User user;
  final String body;
  final int karmaCount;
  final DateTime createdAt;
}

/// firestoreから読み取ったデータを直接入れるやつ。KarmaPostの中間的な役割
class KarmaPostJson {
  const KarmaPostJson({
    @required this.uid,
    @required this.userId,
    @required this.body,
    @required this.karmaCount,
    @required this.createdAt,
  })  : assert(uid != null),
        assert(userId != null),
        assert(body != null),
        assert(karmaCount != null),
        assert(createdAt != null);

  factory KarmaPostJson.fromMap(Map<String, dynamic> map) {
    return KarmaPostJson(
      uid: map['uid'] as String,
      userId: map['userId'] as String,
      body: map['body'] as String,
      karmaCount: map['karmaCount'] as int,
      createdAt: map['createdAt'].toDate() as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userId': userId,
      'body': body,
      'karmaCount': karmaCount,
      'createdAt': createdAt,
    };
  }

  final String uid;
  final String userId;
  final String body;
  final int karmaCount;
  final DateTime createdAt;
}
