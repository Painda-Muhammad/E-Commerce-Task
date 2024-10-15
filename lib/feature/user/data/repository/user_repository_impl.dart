import 'package:e_commerce_task/feature/user/data/remot_data_source/user_remote_data_source.dart';
import 'package:e_commerce_task/feature/user/domain/entity/user_entity.dart';
import 'package:e_commerce_task/feature/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.remotDataSource});

  final UserRemotDataSource remotDataSource;

  @override
  Future<void> forgotPassword(String email) =>
      remotDataSource.forgotPassword(email);

  @override
  Stream<List<UserEntity>> getAllUsers(UserEntity user) =>
      remotDataSource.getAllUsers(user);

  @override
  Future<void> getCreateCurrentUser(UserEntity user) =>
      remotDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUId() => remotDataSource.getCurrentUId();

  @override
  Stream<List<UserEntity>> getSingleUser(UserEntity user) =>
      remotDataSource.getSingleUser(user);

  @override
  Future<void> getUpdateUser(UserEntity user) =>
      remotDataSource.getUpdateUser(user);

  @override
  Future<void> googleAuth() => remotDataSource.googleAuth();

  @override
  Future<bool> isLogIn() => remotDataSource.isLogIn();

  @override
  Future<void> logIn(UserEntity user) => remotDataSource.logIn(user);

  @override
  Future<void> signOut() => remotDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) => remotDataSource.signUp(user);
}
