import 'package:e_commerce_task/feature/user/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<void> googleAuth();
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<void> forgotPassword(String email);

  Future<bool> isLogIn();
  Future<void> logIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<void> getUpdateUser(UserEntity user);
  Future<String> getCurrentUId();
  Stream<List<UserEntity>> getAllUsers(UserEntity user);
  Stream<List<UserEntity>> getSingleUser(UserEntity user);
}
