import 'package:flutter/material.dart';

import 'package:testpractice/presentation/logIn/widgets/clippath_widget.dart';
import 'package:testpractice/presentation/logIn/widgets/form_login_widget.dart';

import '../../../core/utils/app_colors.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
      ),
      body: Column(children: [
        const BuildClipPath(),
        BuildFormLogIn(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController)
      ]),
    );
  }
}


