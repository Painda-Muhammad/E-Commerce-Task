import '../../domain/entity/user_entity.dart';

abstract class UserRemotDataSource{
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