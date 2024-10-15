import 'package:e_commerce_task/feature/user/domain/repository/user_repository.dart';

class SignOutUsecase {
  SignOutUsecase(this._repository);
  final UserRepository _repository;

  Future<void> call() {
    return _repository.signOut();
  }
}
