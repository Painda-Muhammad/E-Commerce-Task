import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_task/feature/user/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.uid,
    super.name,
    super.email,
    super.status,
    super.isActive,
    super.profileImageUrl,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
        uid: snapshot.get('uid'),
        name: snapshot.get('name'),
        email: snapshot.get('email'),
        status: snapshot.get('status'),
        isActive: snapshot.get('isActive'),
        profileImageUrl: snapshot.get('profileImageUrl'));
  }

  Map<String, dynamic> toDocument() {
    return {
      'uid': uid,
      'name': name,
      'email ': email,
      'status': status,
      'isActive': isActive,
      'profileImageUrl': profileImageUrl,
    };
  }
}
