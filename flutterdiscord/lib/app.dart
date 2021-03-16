import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/config/theme.dart';
import 'package:riverpod_template/packages/user/user_repository.dart';
import 'package:riverpod_template/pages/login/login_page.dart';
import 'pages/error/error.dart';
import 'pages/home/home.dart';
import 'pages/splash/splash.dart';

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme().lightTheme(),
      home: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return const ErrorPage();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return Consumer(builder: (context, watch, child) {
              final currentUser = watch(authUserProvider);
              final userProvider = watch(databaseUserProvider);
              return currentUser.when(data: (data) {
                if (data == null) {
                  return const LoginPage();
                }
                return userProvider.when(
                  data: (user) {
                    return const HomePage();
                  },
                  loading: () {
                    return const SplashPage();
                  },
                  error: (e, st) {
                    return const LoginPage();
                  },
                );
              }, loading: () {
                return const SplashPage();
              }, error: (e, st) {
                return const LoginPage();
              });
            });
          }
          return const SplashPage();
        },
      ),
    );
  }
}
