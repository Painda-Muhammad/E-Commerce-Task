import 'package:e_commerce_task/core/commom_widgets/text_field_container.dart';
import 'package:e_commerce_task/core/commom_widgets/toast_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/commom_widgets/buttonContainer.dart';
import '../../cubit/credentials/cubit/credentials_cubit.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  FocusNode? _focusNode;
  final isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.back)),
              const SizedBox(
                height: 20,
              ),
              Text('Forgot Password',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 80,
              ),
              Text(
                'Please, enter your email address. You will receive a link to create a new password via email.',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldContainer(
                title: 'email',
                focusNode: _focusNode,
                controller: emailController,
              ),
              const SizedBox(
                height: 55,
              ),
              ButtonContainer(
                  ontap: submitEmailForResetPassword, title: 'Send'),
              const SizedBox(
                height: 10,
              ),
              if (isLoading)
                const Row(
                  children: [
                    Text('Please wait ...'),
                    CircularProgressIndicator()
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  void submitEmailForResetPassword() {
    if (emailController.text.isEmpty && !emailController.text.contains('@')) {
      toastMessage(
          context: context,
          toastMsg: 'Not a valid email address. Should be your email.com',
          color: Theme.of(context).colorScheme.error);
      return;
    }
    BlocProvider.of<CredentialsCubit>(context)
        .forgotPasswordSubmit(email: emailController.text)
        .then((value) => _clear());
  }

  _clear() {
    emailController.clear();
    _focusNode!.unfocus();
  }
}
