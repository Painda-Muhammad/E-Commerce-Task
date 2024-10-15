import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_task/feature/user/data/model/user_model.dart';
import 'package:e_commerce_task/feature/user/data/remot_data_source/user_remote_data_source.dart';
import 'package:e_commerce_task/feature/user/domain/entity/user_entity.dart';

import 'package:firebase_auth/firebase_auth.dart';

class UserRemotDataSourceImpl implements UserRemotDataSource {
  UserRemotDataSourceImpl({required this.auth, required this.firstore});

  final FirebaseAuth auth;
  final FirebaseFirestore firstore;

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Stream<List<UserEntity>> getAllUsers(UserEntity user) {
    final allUserCollectionRef = firstore.collection('users');

    return allUserCollectionRef
        .where('uid', isNotEqualTo: user.uid)
        .snapshots()
        .map((querSnapshot) {
      return querSnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    });
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollectionRef = firstore.collection('users');
    final uid = await getCurrentUId();

    await userCollectionRef.doc(uid).get().then((userDoc) async {
      final newUser = UserModel(
        email: user.email,
        name: user.name,
        profileImageUrl: user.profileImageUrl,
        status: user.status,
        isActive: user.isActive,
        uid: uid,
      ).toDocument();

      if (!userDoc.exists) {
        await userCollectionRef.doc(uid).set(newUser);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Stream<List<UserEntity>> getSingleUser(UserEntity user) {
    final singleUserCollectionRef = firstore.collection('users');

    return singleUserCollectionRef
        .where('uid', isEqualTo: user.uid)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    });
  }

  @override
  Future<void> getUpdateUser(UserEntity user) async {
    final userCollectionRef = firstore.collection('user');
    final uid = userCollectionRef.id;

    Map<String, dynamic> userInfo = {};

    if (user.name!.isNotEmpty && user.name != null) {
      userInfo['name'] = user.name;
    }
    if (user.isActive!) {
      userInfo['isActive'] = user.isActive!;
    }
    if (user.profileImageUrl!.isNotEmpty) {
      userInfo['profileImageUrl'] = user.profileImageUrl;
    }
    if (user.status!.isNotEmpty) {
      userInfo['status'] = user.status;
    }

    userCollectionRef.doc(uid).update(userInfo);
  }

  @override
  Future<void> googleAuth() async {}

  @override
  Future<bool> isLogIn() async => auth.currentUser != null;

  @override
  Future<void> logIn(UserEntity user) async {
    await auth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> signOut() async => await auth.signOut();

  @override
  Future<void> signUp(UserEntity user) async {
    await auth
        .createUserWithEmailAndPassword(
            email: user.email!, password: user.password!)
        .then((_) async => await getCreateCurrentUser(user));
  }
}
