import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/repositories/tuning_repository.dart';
import 'list_tuning_types_state.dart';

class ListTuningTypesStateNotifier extends StateNotifier<ListTuningTypesState> {
  ListTuningTypesStateNotifier({required this.repository})
      : super(InitialListTuningTypesState());
  final TuningRepository repository;

  void load() async {
    state = LoadingListTuningTypesState();

    try {
      final result = await repository.tuningTypes();
      state = SuccessListTuningTypesState(data: result);
    } catch (e) {
      state = FailureListTuningTypesState(errorMessage: 'errorMessage');
    }
  }
}
