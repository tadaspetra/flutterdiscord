import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

import 'package:riverpod_template/packages/user/src/services/firebase_auth.dart';
import 'package:riverpod_template/packages/user/src/models/models.dart';
import 'package:riverpod_template/packages/user/src/services/firestore_user.dart';
import 'package:riverpod_template/packages/user/user_repository.dart';

/// User from Firebase Authentication
final authUserProvider = StreamProvider<User?>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.user;
});

/// User from Firestore
final databaseUserProvider = FutureProvider<DatabaseUser?>((ref) {
  final databaseRepo = ref.watch(userRespositoryProvider);
  final authRepo = ref.watch(authUserProvider);
  return authRepo.when(
    data: (data) {
      if (data?.uid == null) {
        // if data or the uid is null return null
        return Future.value();
      } else {
        return databaseRepo.getCurrentUser();
      }
    },
    loading: () => Future.value(),
    error: (e, st) => Future.value(),
  );
});
