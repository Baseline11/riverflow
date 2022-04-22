import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'logger.dart';

abstract class BaseActor {
  final ProviderContainer providerContainer;

  BaseActor(this.providerContainer);

  T readObservable<T>(StateProvider<T> provider) {
    return providerContainer.read(provider.notifier).state;
  }

  void writeObservable<T>(StateProvider<T> provider, T value,
      {bool cache = false}) {
    providerContainer.read(provider.notifier).state = value;
  }

  @mustCallSuper
  void dispose() {
    logger.d('disposing $runtimeType');
  }
}
