part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
final class Authenticated extends AuthState{
 const Authenticated({required this.uid});
 final String uid;

@override
 List<Object> get props => [uid];
}
final class UnAuthenticated extends AuthState{}
