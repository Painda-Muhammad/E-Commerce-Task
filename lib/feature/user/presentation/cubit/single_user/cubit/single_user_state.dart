part of 'single_user_cubit.dart';

sealed class SingleUserState extends Equatable {
  const SingleUserState();

  @override
  List<Object> get props => [];
}

final class SingleUserInitial extends SingleUserState {}
final class SingleUserLoading extends SingleUserState {}
final class SingleUserLoaded extends SingleUserState {
 const SingleUserLoaded({required this.singleUser});
 final UserEntity singleUser;
}
final class SingleUserFailure extends SingleUserState {}
