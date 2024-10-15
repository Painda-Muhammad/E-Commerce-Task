import 'package:e_commerce_task/feature/user/domain/repository/user_repository.dart';

class GoogleAuthUsecase {
  GoogleAuthUsecase(this._repository);
  final UserRepository _repository;

  Future<void> call() {
    return _repository.googleAuth();
  }
}
