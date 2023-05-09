import 'package:flutter/material.dart';

class TextFieldLogIn extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String title;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const TextFieldLogIn(
      {Key? key,
      required this.controller,
      required this.isPassword,
      required this.title,
      this.keyboardType,
      this.validator})
      : super(key: key);

  @override
  State<TextFieldLogIn> createState() => _TextFieldLogInState();
}

class _TextFieldLogInState extends State<TextFieldLogIn> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: widget.isPassword? showPassword:false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
          hintText: 'Enter your ${widget.title}',
          suffix: Visibility(
              visible: widget.isPassword,
              child: IconButton(
                  onPressed: () {
                    showPasswordFunction();
                  },
                  icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off))),
          border: const UnderlineInputBorder(),

      ),
    );
  }

  showPasswordFunction() {
    setState(() {
      showPassword = !showPassword;
      print(showPassword.toString());
    });
  }
}
