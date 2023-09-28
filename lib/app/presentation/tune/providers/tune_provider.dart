import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/Provider/app_provider.dart';
import 'package:m_s_afinador/app/presentation/tune/states/list_instruments/list_instruments_state.dart';
import 'package:m_s_afinador/app/presentation/tune/states/list_instruments/list_instruments_state_notifier.dart';
import '../states/list_tuning/list_tuning_types_state.dart';
import '../states/list_tuning/list_tuning_types_state_notifier.dart';

final listTuningTypesProvider =
    StateNotifierProvider<ListTuningTypesStateNotifier, ListTuningTypesState>(
  (ref) => ListTuningTypesStateNotifier(
    repository: ref.read(tuningProvider),
  ),
);

final listInstrumentsProvider =
    StateNotifierProvider<ListInstrumentsStateNotifier, ListInstrumentsState>(
  (ref) => ListInstrumentsStateNotifier(
    repository: ref.read(tuningProvider),
  ),
);
