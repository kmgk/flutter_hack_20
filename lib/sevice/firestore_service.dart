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
    try {
      await _firestore.document('$usersPath/${user.uid}').setData(user.toMap());
    } catch (e) {
      print('Error in FirestoreService.createUser: $e');
      rethrow;
    }
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
    try {
      final Map<String, dynamic> ecoPostMap = ecoPost.toMap();
      final String uid =
          _firestore.collection(ecoPostsPath).document().documentID;
      ecoPostMap['uid'] = uid;
      await _firestore.document('$ecoPostsPath/$uid').setData(ecoPostMap);
    } catch (e) {
      print('Error in FirestoreService.createEcoPost: $e');
      rethrow;
    }
  }

  /// EcoPostを全て読み取り、List<EcoPostJson>を返す
  Stream<List<EcoPostJson>> readEcoPosts() {
    try {
      return _firestore
          .collection(ecoPostsPath)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((QuerySnapshot qs) => qs.documents.map((DocumentSnapshot ds) {
                final Map<String, dynamic> ecoPostMap = ds.data;
                ecoPostMap['uid'] = ds.documentID;
                return EcoPostJson.fromMap(ecoPostMap);
              }).toList());
    } catch (e) {
      print('Error in FirestoreService.readEcoPosts $e');
      rethrow;
    }
  }

  /// EcoPostのListを返す
  Stream<List<EcoPost>> getEcoPosts(List<EcoPostJson> eList) async* {
    try {
      final List<EcoPost> ecoPostList = <EcoPost>[];
      for (final EcoPostJson ecoPostJson in eList) {
        final DocumentSnapshot doc =
            await _firestore.document('$usersPath/${ecoPostJson.userId}').get();
        final Map<String, dynamic> ecoPostMap = ecoPostJson.toMap();
        ecoPostMap['user'] = User.fromMap(doc.data);
        ecoPostMap['uid'] = ecoPostJson.uid;
        ecoPostList.add(EcoPost.fromMap(ecoPostMap));
      }

      yield ecoPostList;
    } catch (e) {
      print('Error in FirestoreService.getEcoPosts: $e');
      rethrow;
    }
  }

  /// EcoPostを更新する
  Future<void> updateEcoPost(EcoPost ecoPost) async {
    try {
      await _firestore
          .document('$ecoPostsPath/${ecoPost.uid}')
          .setData(ecoPost.toMap());
    } catch (e) {
      print('Error in FirestoreService.updateEcoPost: $e');
      rethrow;
    }
  }

  /// 新しいKarmaPostを作成する
  Future<void> createKarmaPost(KarmaPost karmaPost) async {
    try {
      final Map<String, dynamic> karmaPostMap = karmaPost.toMap();
      final String uid =
          _firestore.collection(karmaPostsPath).document().documentID;
      karmaPostMap['uid'] = uid;
      await _firestore.document('$karmaPostsPath/$uid').setData(karmaPostMap);
    } catch (e) {
      print('Error in FirestoreService.createKarmaPost: $e');
      rethrow;
    }
  }

  /// KarmaPostを全て読み取り、List<KarmaPostJson>を返す
  Stream<List<KarmaPostJson>> readKarmaPosts() {
    try {
      return _firestore
          .collection(karmaPostsPath)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((QuerySnapshot qs) => qs.documents.map((DocumentSnapshot ds) {
                final Map<String, dynamic> karmaPostMap = ds.data;
                karmaPostMap['uid'] = ds.documentID;
                return KarmaPostJson.fromMap(karmaPostMap);
              }).toList());
    } catch (e) {
      print('Error in FirestoreService.readEcoPosts $e');
      rethrow;
    }
  }

  /// KarmaPostのListを返す
  Stream<List<KarmaPost>> getKarmaPosts(List<KarmaPostJson> kList) async* {
    try {
      final List<KarmaPost> karmaPostList = <KarmaPost>[];
      for (final KarmaPostJson karmaPostJson in kList) {
        final DocumentSnapshot doc = await _firestore
            .document('$usersPath/${karmaPostJson.userId}')
            .get();
        final Map<String, dynamic> karmaPostMap = karmaPostJson.toMap();
        karmaPostMap['user'] = User.fromMap(doc.data);
        karmaPostMap['uid'] = karmaPostJson.uid;
        karmaPostList.add(KarmaPost.fromMap(karmaPostMap));
      }
      yield karmaPostList;
    } catch (e) {
      print('Error in FirestoreService.getKarmaPosts: $e');
      rethrow;
    }
  }

  /// KarmaPostを更新する
  Future<void> updateKarmaPost(KarmaPost karmaPost) async {
    try {
      await _firestore
          .document('$karmaPostsPath/${karmaPost.uid}')
          .setData(karmaPost.toMap());
    } catch (e) {
      print('Error in FirestoreService.updateKarmaPost: $e');
      rethrow;
    }
  }
}
