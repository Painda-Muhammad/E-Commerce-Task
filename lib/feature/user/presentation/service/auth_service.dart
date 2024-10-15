import 'package:e_commerce_task/core/commom_widgets/toast_message.dart';
import 'package:e_commerce_task/feature/user/domain/entity/user_entity.dart';
import 'package:e_commerce_task/feature/user/presentation/cubit/credentials/cubit/credentials_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthService {
  const AuthService(this.emailController, this.nameController,
      this.passwordController, this.isLogin);
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final bool isLogin;

  void submitUserRagisteration(BuildContext context, focused) {
    if (!isLogin) {
      if (nameController.text.isEmpty &&
          nameController.text == '' &&
          nameController.text.length < 3) {
        toastMessage(
            context: context,
            toastMsg: 'Enter valid name',
            color: Theme.of(context).colorScheme.error);
        return;
      }
    }
    if (emailController.text == '' && !emailController.text.contains('@')) {
      toastMessage(
          context: context,
          toastMsg: 'Enter valid email',
          color: Theme.of(context).colorScheme.error);
      return;
    }
    if (passwordController.text == '' && passwordController.text.length < 5) {
      toastMessage(
          context: context,
          toastMsg: 'Enter the strong password ',
          color: Theme.of(context).colorScheme.error);
      return;
    }

    if (isLogin) {
      BlocProvider.of<CredentialsCubit>(context)
          .logInSubmit(
              email: emailController.text, password: passwordController.text)
          .then((value) => _clear(focused));
    } else {
      BlocProvider.of<CredentialsCubit>(context)
          .signUpSubmit(UserEntity(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        isActive: false,
        profileImageUrl: '',
        status: '',
      ))
          .then((value) {
        _clear(focused);
      });
    }
  }

  _clear(focused) {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    // focused.unfocus();
  }
}
