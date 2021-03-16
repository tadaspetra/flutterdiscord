import 'package:riverpod_template/packages/user/src/models/database_user/database_user.dart';

abstract class UserRepository {
  const UserRepository();

  Future<DatabaseUser?> getCurrentUser();
}
