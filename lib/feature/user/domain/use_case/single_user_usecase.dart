import 'package:e_commerce_task/feature/user/domain/entity/user_entity.dart';
import 'package:e_commerce_task/feature/user/domain/repository/user_repository.dart';

class SingleUserUsecase {
  SingleUserUsecase(this._repository);
  final UserRepository _repository;

  Stream<List<UserEntity>> call(UserEntity user) {
    return _repository.getSingleUser(user);
  }
}
