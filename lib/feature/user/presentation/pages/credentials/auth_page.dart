import 'package:e_commerce_task/core/commom_widgets/toast_message.dart';
import 'package:e_commerce_task/core/navigation_bar/bottom_navigation_bar.dart';
import 'package:e_commerce_task/feature/user/domain/entity/user_entity.dart';
import 'package:e_commerce_task/feature/user/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_task/feature/user/presentation/cubit/credentials/cubit/credentials_cubit.dart';
import 'package:e_commerce_task/feature/user/presentation/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode? _focusNode;
  bool isLogin = true;

  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).loggedIn();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialsCubit, CredentialsState>(
        builder: (context, credentialState) {
          if (credentialState is CredentialsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (credentialState is CredentialsSucess) {
            return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
              if (authState is Authenticated) {
                // return  EBottomNavigationBarWidget(uid: authState.uid,);
                return const EBottomNavigationBarWidget();
              } else {
                return AuthWidget(
                  emailController: emailController,
                  focusNode: _focusNode,
                  isLogin: isLogin,
                  nameController: nameController,
                  passwordController: passwordController,
                  submitUserRagisteration: submitUserRagisteration,
                );
              }
            });
          }
          return AuthWidget(
            emailController: emailController,
            focusNode: _focusNode,
            isLogin: isLogin,
            nameController: nameController,
            passwordController: passwordController,
            submitUserRagisteration: submitUserRagisteration,
          );
        },
        listener: (context, credentialState) {
          if (credentialState is CredentialsSucess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialsFailure) {
            toastMessage(
                context: context,
                toastMsg: 'The user is not authencaticed',
                color: Theme.of(context).colorScheme.error);
          }
        },
      ),
    );
  }

  void submitUserRagisteration() {
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
      BlocProvider.of<CredentialsCubit>(context).logInSubmit(
          email: emailController.text, password: passwordController.text);
      // .then((value) => _clear());
    }
    if (!isLogin) {
      BlocProvider.of<CredentialsCubit>(context).signUpSubmit(UserEntity(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        isActive: false,
        profileImageUrl: '',
        status: '',
      ))
          //     .then((value) {
          //   _clear();
          // })
          ;
    }
  }

  // _clear() {
  //   nameController.clear();
  //   emailController.clear();
  //   passwordController.clear();
  //   _focusNode!.unfocus();
  // }
}
