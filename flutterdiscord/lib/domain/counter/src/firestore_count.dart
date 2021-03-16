import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_template/packages/user/user_repository.dart';
import '../count_repository.dart';

// access to repository inteface. Should not be touched in UI
final countRepository = Provider<CounterRepository>((ref) => FirestoreCount(ref.read));

class FirestoreCount implements CounterRepository {
  FirestoreCount(this.read);

  Reader read;
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> add() async {
    final currentUser = read(databaseUserProvider);
    currentUser.whenData(
      (data) async {
        if (data?.uid != null) {
          return users.doc(data!.uid).update(<String, dynamic>{
            'count': FieldValue.increment(1),
          });
        } else {
          throw Exception("You don't have a database user!!");
        }
      },
    );
  }

  @override
  Stream<int?> getCount() {
    final currentUser = read(databaseUserProvider);
    return currentUser.when(
      data: (data) {
        if (data?.uid != null) {
          return users.doc(data!.uid).snapshots().map((event) => event.data()?["count"]);
        } else {
          throw Exception("You don't have a database user!!");
        }
      },
      loading: () {
        return Stream.value(0);
      },
      error: (e, st) {
        return Stream.value(0);
      },
    );
  }
}
