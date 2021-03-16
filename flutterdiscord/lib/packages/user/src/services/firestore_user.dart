import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_template/packages/user/src/models/database_user/database_user.dart';
import 'package:riverpod_template/packages/user/src/user_repository.dart';
import 'package:riverpod_template/packages/user/src/providers.dart';

/// Provides methods to read and write to the User database.
final userRespositoryProvider = Provider<UserRepository>((ref) {
  return FirestoreUserRepository(ref.read);
});

class FirestoreUserRepository implements UserRepository {
  FirestoreUserRepository(this.read);

  final Reader read;

  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Future<DatabaseUser?> getCurrentUser() async {
    final currentUser = await read(authUserProvider.last);
    if (currentUser?.uid != null) {
      return DatabaseUser.fromDocumentSnapshot(await users.doc(currentUser!.uid).get());
    }
    return null;
  }
}
