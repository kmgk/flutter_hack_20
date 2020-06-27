import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hack20/model/ecoPost.dart';
import 'package:flutter_hack20/model/karmaPost.dart';
import 'package:flutter_hack20/model/user.dart';

class FirestoreService {
  static final Firestore _firestore = Firestore.instance;
  static final FirestoreService instance = FirestoreService();

  static const String usersPath = 'users';
  static const String ecoPostsPath = 'ecoPosts';
  static const String karmaPostsPath = 'karmaPosts';

  /// 新規ユーザをDBに保存する
  Future<void> createUser(User user) async {
    _firestore.document('$usersPath/${user.uid}').setData(user.toMap());
  }

  Stream<User> getCurrentUser(FirebaseUser user) {
    try {
      return _firestore
          .document('$usersPath/${user.uid}')
          .snapshots()
          .map((DocumentSnapshot ds) => User.fromMap(ds.data));
    } catch (e) {
      print('Error in FirestoreService.getCurrentUser: $e');
      rethrow;
    }
  }

  /// 新しいEcoPostを作成する
  Future<void> createEcoPost(EcoPost ecoPost) async {
    // TODO
  }

  /// EcoPostを全て読み取り、List<EcoPostJson>を返す
  Stream<List<EcoPostJson>> readEcoPosts() {
    // TODO
  }

  /// EcoPostのListを返す
  Stream<List<EcoPost>> getEcoPosts(List<EcoPostJson> eList) async* {
    // TODO
  }

  /// EcoPostを更新する
  Future<void> updateEcoPost(EcoPost ecoPost) async {
    // TODO
  }

  /// 新しいKarmaPostを作成する
  Future<void> createKarmaPost(KarmaPost karmaPost) async {
    // TODO
  }

  /// KarmaPostを全て読み取り、List<KarmaPostJson>を返す
  Stream<List<KarmaPostJson>> readKarmaPosts() {
    // TODO
  }

  /// KarmaPostのListを返す
  Stream<List<KarmaPost>> getKarmaPosts(List<KarmaPostJson> kList) async* {
    // TODO
  }

  /// KarmaPostを更新する
  Future<void> updateKarmaPost(KarmaPost karmaPost) async {
    // TODO
  }
}
