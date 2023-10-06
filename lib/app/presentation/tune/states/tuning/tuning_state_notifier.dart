import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/repositories/tuning_repository.dart';
import 'tuning_state.dart';

class TuningStateNotifier extends StateNotifier<TuningState> {
  TuningStateNotifier({required this.repository}) : super(InitialTuningState());
  final TuningRepository repository;

  void loadTunings(String? instrumentId) async {
    state = LoadingTuningState();

    try {
      final result = await repository.getTunings(instrumentId);
      state = SuccessTuningState(data: result);
    } catch (e) {
      state = FailureTuningState(errorMessage: 'errorMessage');
    }
  }
}
