import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(onPressed: () => Navigator.pop(context)),
              ],
            ),
          ),
          const Spacer(flex: 3),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: SignUpForm(),
            ),
          ),
          const Spacer(flex: 8),
        ],
      ),
    );
  }
}
