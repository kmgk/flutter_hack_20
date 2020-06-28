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

  /// Save a new user in the DB
  Future<void> createUser(User user) async {
    try {
      await _firestore
          .document('$usersPath/${user.uid}')
          .setData(user.toMap(), merge: true);
    } catch (e) {
      print('Error in FirestoreService.createUser: $e');
      rethrow;
    }
  }

  /// Retrieve the currently logged in user and return as User model
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

  /// Increment the ecoPoint and totalEcoPoint fields in User
  Future<void> incrementUserEcoPoint(User user) async {
    try {
      await _firestore.document('$usersPath/${user.uid}').setData(
        <String, dynamic>{
          'ecoPoint': FieldValue.increment(1),
          'totalEcoPoint': FieldValue.increment(1),
        },
        merge: true,
      );
    } catch (e) {
      print('Error in FirestoreService.incrementUserEcoPoint: $e');
      rethrow;
    }
  }

  /// Increment the karmaPoint and totalKarmaPoint fields in User
  Future<void> incrementUserKarmaPoint(User user) async {
    try {
      await _firestore.document('$usersPath/${user.uid}').setData(
        <String, dynamic>{
          'karmaPoint': FieldValue.increment(1),
          'totalKarmaPoint': FieldValue.increment(1),
        },
        merge: true,
      );
    } catch (e) {
      print('Error in FirestoreService.incrementUserKarmaPoint: $e');
      rethrow;
    }
  }

  /// Update the user.
  Future<void> updateUser(User user) async {
    try {
      await _firestore
          .document('$usersPath/${user.uid}')
          .setData(user.toMap(), merge: true);
    } catch (e) {
      print('Error in FirestoreService.updateUser: $e');
      rethrow;
    }
  }

  /// Creat a New EcoPost
  Future<void> createEcoPost(EcoPost ecoPost) async {
    try {
      final Map<String, dynamic> ecoPostMap = ecoPost.toMap();
      final String uid =
          _firestore.collection(ecoPostsPath).document().documentID;
      ecoPostMap['uid'] = uid;
      await _firestore
          .document('$ecoPostsPath/$uid')
          .setData(ecoPostMap, merge: true);
    } catch (e) {
      print('Error in FirestoreService.createEcoPost: $e');
      rethrow;
    }
  }

  /// Reads all EcoPosts and returns List<EcoPostJson>.
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

  /// Takes a List of EcoPostJson and returns a List of EcoPost.
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

  /// Increment the ecoCount field in EcoPost
  Future<void> incrementEcoCount(EcoPost ecoPost) async {
    try {
      await _firestore.document('$ecoPostsPath/${ecoPost.uid}').setData(
        <String, dynamic>{'ecoCount': FieldValue.increment(1)},
        merge: true,
      );
    } catch (e) {
      print('Error in FirestoreService.incrementEcoCount: $e');
      rethrow;
    }
  }

  /// Update EcoPost
  Future<void> updateEcoPost(EcoPost ecoPost) async {
    try {
      await _firestore
          .document('$ecoPostsPath/${ecoPost.uid}')
          .setData(ecoPost.toMap(), merge: true);
    } catch (e) {
      print('Error in FirestoreService.updateEcoPost: $e');
      rethrow;
    }
  }

  /// Create new KarmaPost
  Future<void> createKarmaPost(KarmaPost karmaPost) async {
    try {
      final Map<String, dynamic> karmaPostMap = karmaPost.toMap();
      final String uid =
          _firestore.collection(karmaPostsPath).document().documentID;
      karmaPostMap['uid'] = uid;
      await _firestore
          .document('$karmaPostsPath/$uid')
          .setData(karmaPostMap, merge: true);
    } catch (e) {
      print('Error in FirestoreService.createKarmaPost: $e');
      rethrow;
    }
  }

  /// Reads all KarmaPosts and returns List<KarmaPostJson>.
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

  /// Takes a List of KarmaPostJson and returns a List of KarmaPost.
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

  /// Increment the karmaPoint field in KarmaPost
  Future<void> incrementKarmaCount(KarmaPost karmaPoint) async {
    try {
      await _firestore.document('$karmaPostsPath/${karmaPoint.uid}').setData(
        <String, dynamic>{'karmaCount': FieldValue.increment(1)},
        merge: true,
      );
    } catch (e) {
      print('Error in FirestoreService.incrementKarmaCount: $e');
      rethrow;
    }
  }

  /// Update KarmaPost
  Future<void> updateKarmaPost(KarmaPost karmaPost) async {
    try {
      await _firestore
          .document('$karmaPostsPath/${karmaPost.uid}')
          .setData(karmaPost.toMap(), merge: true);
    } catch (e) {
      print('Error in FirestoreService.updateKarmaPost: $e');
      rethrow;
    }
  }
}
