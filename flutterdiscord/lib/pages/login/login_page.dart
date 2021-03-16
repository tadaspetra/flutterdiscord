import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(32.0),
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}
