import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'database_user.freezed.dart';

@freezed
abstract class DatabaseUser with _$DatabaseUser {
  const factory DatabaseUser({
    required String uid,
    required String email,
    String? name,
  }) = _DatabaseUser;

  factory DatabaseUser.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return DatabaseUser(
      uid: documentSnapshot.id, // Did we plan to make the uid the document id?
      email: documentSnapshot.data()?["email"],
      name: documentSnapshot.data()?["name"],
    );
  }
}
