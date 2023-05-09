import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpractice/core/utils/app_colors.dart';
import 'package:testpractice/core/utils/helper_extenstions.dart';
import 'package:testpractice/core/widgets/text_widget.dart';
import 'package:testpractice/presentation/home/view_model/login_riverpod.dart';

import '../../home/screens/home_navigator_screen.dart';
import 'text_field_widget.dart';


class BuildFormLogIn extends StatelessWidget {
  const BuildFormLogIn({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldLogIn(
                  controller: _emailController,
                  isPassword: false,
                  title: 'email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid mail';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress),
              TextFieldLogIn(
                  controller: _passwordController,
                  isPassword: true,
                  title: 'password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword),
              20.ph,
              Consumer(builder: (context, ref, child) {
                final log = ref.watch(login);
                return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        log
                            .logIn(
                            _emailController.text, _passwordController.text)
                            .then((value) {
                          if (value.statusCode == 200) {
                            context.pushAndRemoveUntil(
                              const HomeNavigatorScreen(),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    const Icon(
                                      Icons.thumb_up_alt_rounded,
                                      color: Colors.white54,
                                    ),
                                    10.pw,
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(value.data['message']),
                                        Text(
                                            'Sign in ${value.data['message']}'),
                                      ],
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        }).onError((DioError error, stackTrace) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  const Icon(
                                    Icons.error,
                                    color: Colors.white54,
                                  ),
                                  10.pw,
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(error.response!.data['message']),
                                      Text(
                                          'Sign in ${error.response!.data['message']}'),
                                    ],
                                  ),
                                ],
                              ),
                              backgroundColor: AppColor.pink,
                            ),
                          );
                          debugPrint(
                              'onError logIn ${error.response!.data['message']}');
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: AppColor.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const TextWidget(
                      txt: 'Sign in',
                      color: AppColor.white,
                      fontSize: 18,
                    ));
              }),
              TextButton(
                  onPressed: () {},
                  child: const TextWidget(
                    txt: 'Forgot password?',
                    color: AppColor.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              20.ph,
              TextButton(
                  onPressed: () {
                    context.pushAndRemoveUntil(
                      const HomeNavigatorScreen(),
                    );
                  },
                  child: const TextWidget(
                    txt: 'Browse as a guest',
                    color: AppColor.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )),
            ],
          )),
    );
  }
}
