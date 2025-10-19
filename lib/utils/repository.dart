import 'dart:async';

import 'package:chat_gpt/utils/service_locator.dart';
import 'package:objectbox/objectbox.dart';

abstract class Repository<T> {
  final controller = StreamController<T>.broadcast();
  late final StreamSubscription? subscription;
  Stream<T> get updates => controller.stream;
  late T _value;
  T get value => _value;
  T call() => _value;

  Repository() {
    subscription = updates.listen(
      (event) {
        _value = event;
      },
      onError: (error) => print(error),
      onDone: () => print('done'),
      cancelOnError: false,
    );
    init();
  }

  FutureOr<void> init() {}
  void update(T value) => controller.add(value);

  S serve<S extends Object>() => locator.serve<S>();
  FutureOr<void> dispose() {
    subscription?.cancel();
    subscription = null;
    controller.close();
  }
}

abstract class CrudRepository<T> extends Repository<Iterable<T>> {
  @override
  FutureOr<void> init() {
    update(box.getAll());
  }

  int getId(T value);
  late final store = serve<Store>();
  late final box = store.box<T>();

  T? get(int id) => box.get(id);

  void put(T item) {
    box.put(item);
    update(box.getAll());
  }

  void remove(T item) {
    box.remove(getId(item));
    update(box.getAll());
  }

  void removeAll() {
    update([]);
    box.removeAll();
  }
}
