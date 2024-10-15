
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable
{
  final String? uid;
  final String?  name;
  final String? email;
  final String? profileImageUrl;
  final String? status;
  final bool? isActive;
  final String? password;

 const UserEntity({
     this.uid,
     this.name,
     this.email,
     this.isActive,
     this.password,
     this.status,
     this.profileImageUrl
  });

  
  @override
  List<Object?> get props => [
    uid,
    name,
    email,
    isActive,
    password,
    status,
    password,
    profileImageUrl
  ];
  
}