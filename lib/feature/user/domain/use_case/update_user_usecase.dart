import 'package:e_commerce_task/feature/user/domain/entity/user_entity.dart';
import 'package:e_commerce_task/feature/user/domain/repository/user_repository.dart';

class UpdateUserUsecase {
  UpdateUserUsecase(this._repository);
  final UserRepository _repository;

  Future<void> call(UserEntity user) {
    return _repository.getUpdateUser(user);
  }
}
