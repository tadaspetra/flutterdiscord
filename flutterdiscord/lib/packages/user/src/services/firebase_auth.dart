import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/packages/user/src/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Provides methods to interact with Firebase Authentication.
final authRepositoryProvider = Provider<AuthRepository>((ref) => FirebaseAuthRepository());

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  @override
  Stream<User?> get user {
    return _firebaseAuth.userChanges();
  }

  /// Creates a new user with the provided [email] and [password].
  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      rethrow;
    }
  }

  /// Signs in with the provided [email] and [password].
  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  @override
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
    } on Exception {
      rethrow;
    }
  }
}
