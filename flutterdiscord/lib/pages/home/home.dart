import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_template/domain/counter/src/firestore_count.dart';
import 'package:riverpod_template/packages/user/src/services/firebase_auth.dart';
import 'package:riverpod_template/providers/counter_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, watch, child) {
              final counter = watch(currentCounterProvider);
              return counter.when(
                  data: (data) {
                    return Text("Counter: ${data.toString()}");
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (e, st) => const Text("error"));
            }),
            ElevatedButton(
              onPressed: () {
                context.read(authRepositoryProvider).logOut();
              },
              child: const Text("Sign Out"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(countRepository).add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
