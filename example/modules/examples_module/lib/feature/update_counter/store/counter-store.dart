import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/store.dart';

import '../observable/counter_observable.dart';

final counterStoreProvider = Provider((ref) => CounterStore(ref));

class CounterStore extends BaseStore {
  CounterStore(ProviderRef ref) : super(ref);

  CounterObservable get counterO =>
      readObservableeee(counterObservableProvider);

  void updateCounter() => writeObservableeee(counterObservableProvider,
      counterO.copyWith(counter: counterO.counter + 1));
}