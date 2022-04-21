import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal_command_map.dart';


import '../command/update_time_zone_command.dart';
import '../signal/time_zone_changed_signal.dart';

ProviderContainer configureTimeZoneModule() {
  var providerContainer = ProviderContainer(overrides: [
    signalCommandMapProvider
        .overrideWithProvider(Provider((ref) => SignalCommandMap(ref)))
  ]);
  mapCommands(providerContainer);

  return providerContainer;
}

void mapCommands(ProviderContainer container) {
  var signalCommandMap = container.read(signalCommandMapProvider);

  signalCommandMap.map1(
    container.read(updateTimeZoneSignalProvider),
    () => UpdateTimeZoneCommand(signalCommandMap.ref),
  );
}