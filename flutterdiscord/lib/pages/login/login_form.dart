import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/packages/user/src/services/firebase_auth.dart';
import 'package:riverpod_template/pages/sign_up/sign_up_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
              await context
                  .read(authRepositoryProvider)
                  .logInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Login"),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<SignUpPage>(
                  builder: (context) => const SignUpPage(),
                ),
              );
            },
            child: const Text("Don't have an account? Sign Up!"),
          )
        ],
      ),
    );
  }
}
