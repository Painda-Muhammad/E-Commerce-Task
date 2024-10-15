import 'package:e_commerce_task/feature/user/domain/repository/user_repository.dart';

class IsLogInUsecase {
  IsLogInUsecase(this._repository);
  final UserRepository _repository;

  Future<bool> call() {
    return _repository.isLogIn();
  }
}
