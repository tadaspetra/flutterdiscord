abstract class CounterRepository {
  const CounterRepository();

  Stream<int?> getCount();
  Future<void> add();
}
