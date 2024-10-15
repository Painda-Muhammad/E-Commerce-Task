import 'package:e_commerce_task/feature/user/domain/repository/user_repository.dart';

class ForgotPasswordUsecase {
  ForgotPasswordUsecase(this._repository);
  final UserRepository _repository;

  Future<void> call(email) {
    return _repository.forgotPassword(email);
  }
}
