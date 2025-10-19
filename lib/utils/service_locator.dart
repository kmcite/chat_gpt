// ==================== Service Locator ====================
import 'dart:async';

import 'package:chat_gpt/utils/repository.dart';
import 'package:flutter/widgets.dart' as w;

class ServiceLocator {
  final _services = <Type, Object>{};
  final _repositories = <Type, Repository>{};

  // ===== Register Methods =====
  void service<T extends Object>(T instance) {
    if (_services.containsKey(T)) {
      throw ServiceLocatorException(
        'Service of type $T is already registered. '
        'Use updateService() to replace it.',
      );
    }
    _services[T] = instance;
  }

  void repository<T extends Repository>(T instance) {
    if (_repositories.containsKey(T)) {
      throw ServiceLocatorException(
        'Repository of type $T is already registered. '
        'Use updateRepository() to replace it.',
      );
    }
    print('Repository of type $T registered.');
    instance.updates.listen((update) => print('$T -> $update'));
    _repositories[T] = instance;
  }

  // ===== Retrieve Methods =====
  T serve<T extends Object>() {
    final service = _services[T];
    if (service == null) {
      throw ServiceLocatorException('Service of type $T is not registered.');
    }
    return service as T;
  }

  T find<T extends Repository>() {
    final repository = _repositories[T];
    if (repository == null) {
      throw ServiceLocatorException('Repository of type $T is not registered.');
    }
    return repository as T;
  }

  // ===== Update Methods =====
  void updateService<T extends Object>(T instance) => _services[T] = instance;

  void updateRepository<T extends Repository>(T instance) =>
      _repositories[T] = instance;

  // ===== Remove Methods =====
  bool removeService<T extends Object>() => _services.remove(T) != null;

  bool removeRepository<T extends Repository>() =>
      _repositories.remove(T) != null;

  // ===== Check Methods =====
  bool hasService<T extends Object>() => _services.containsKey(T);
  bool hasRepository<T extends Repository>() => _repositories.containsKey(T);

  // ===== Clear Methods =====
  void clearServices() => _services.clear();
  void clearRepositories() => _repositories.clear();
  void clearAll() {
    _services.clear();
    _repositories.clear();
  }

  // ===== Utility Methods =====
  int get serviceCount => _services.length;
  int get repositoryCount => _repositories.length;
}

// ===== Exception Class =====
class ServiceLocatorException implements Exception {
  final String message;

  ServiceLocatorException(this.message);

  @override
  String toString() => 'ServiceLocatorException: $message';
}

// ===== Global Instance =====
final locator = ServiceLocator();

abstract class State<W extends w.StatefulWidget> = w.State<W> with _State<W>;

R find<R extends Repository>() => locator.find<R>();

mixin _State<U extends w.StatefulWidget> on w.State<U> {
  final _subscriptions = <StreamSubscription>[];
  R watch<R extends Repository>() {
    final repository = locator.find<R>();
    _subscriptions.add(repository.updates.listen(notify));
    return repository;
  }

  void notify([_]) {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
    super.dispose();
  }
}
