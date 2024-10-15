import 'package:e_commerce_task/feature/user/domain/repository/user_repository.dart';

class CurrentUserIdUsecase {
  CurrentUserIdUsecase(this._repository);
  final UserRepository _repository;

  Future<String> call() {
    return _repository.getCurrentUId();
  }
}
