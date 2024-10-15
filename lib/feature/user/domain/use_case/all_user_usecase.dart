import 'package:e_commerce_task/feature/user/domain/repository/user_repository.dart';

import '../entity/user_entity.dart';

class AllUserUsecase {
  AllUserUsecase(this._repository);
  final UserRepository _repository;

  Stream<List<UserEntity>> call(UserEntity user) {
    return _repository.getAllUsers(user);
  }
}
