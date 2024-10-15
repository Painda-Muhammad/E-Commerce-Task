import 'package:e_commerce_task/core/commom_widgets/buttonContainer.dart';
import 'package:e_commerce_task/core/commom_widgets/social_loggin_container.dart';
import 'package:e_commerce_task/core/constants/page_constant.dart';
import 'package:e_commerce_task/feature/bag/view/bag_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/commom_widgets/text_field_container.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget(
      {required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.focusNode,
      required this.isLogin,
      required this.submitUserRagisteration,
      super.key});

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function() submitUserRagisteration;
  FocusNode? focusNode;
  bool isLogin = true;

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return BagPage();
                    }), (context) => false);
                  },
                  icon: const Icon(CupertinoIcons.back)),
              const SizedBox(
                height: 20,
              ),
              Text(widget.isLogin ? 'Login' : 'Sign Up',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 50,
              ),
              if (!widget.isLogin)
                TextFieldContainer(
                    controller: widget.nameController,
                    key: const ValueKey('name'),
                    focusNode: widget.focusNode,
                    title: 'Name'),
              if (!widget.isLogin)
                const SizedBox(
                  height: 10,
                ),
              TextFieldContainer(
                  controller: widget.emailController,
                  focusNode: widget.focusNode,
                  key: const ValueKey('email'),
                  title: 'Email'),
              const SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                controller: widget.passwordController,
                focusNode: widget.focusNode,
                key: const ValueKey('password'),
                title: 'Password',
                isAbscure: true,
              ),
              const SizedBox(
                height: 10,
              ),
              if (widget.isLogin)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password ',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, PageConstant.forgotPassword);
                        },
                        icon: Icon(
                          Icons.arrow_forward_sharp,
                          color: Theme.of(context).colorScheme.primary,
                        ))
                  ],
                ),
              const SizedBox(
                height: 25,
              ),
              ButtonContainer(
                title: widget.isLogin ? 'Login' : 'Sign up',
                ontap: widget.submitUserRagisteration,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.isLogin
                        ? "Don't have an account"
                        : 'Already have an account',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          widget.isLogin = !widget.isLogin;
                        });
                      },
                      child: Text(widget.isLogin ? 'Sign up' : 'Login')),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .3,
              ),
              Column(
                children: [
                  Text(
                    'Or signup with social account',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginContainer(
                        ontap: () {},
                        imagePath: 'assets/google.png',
                      ),
                      SocialLoginContainer(
                        ontap: () {},
                        imagePath: 'assets/facebook.png',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
