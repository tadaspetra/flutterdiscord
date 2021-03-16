import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/domain/counter/src/firestore_count.dart';

final currentCounterProvider = StreamProvider.autoDispose<int?>((ref) {
  final countProvider = ref.watch(countRepository);

  return countProvider.getCount();
});
