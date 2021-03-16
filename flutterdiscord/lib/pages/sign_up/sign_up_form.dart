import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/packages/user/src/services/firebase_auth.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm();

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'email',
              helperText: '',
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'password',
              helperText: '',
            ),
            controller: passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await context.read(authRepositoryProvider).signUp(email: emailController.text, password: passwordController.text);
                Navigator.pop(context);
              } catch (e) {
                debugPrint("you have problem :)");
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Sign Up"),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_forward),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
