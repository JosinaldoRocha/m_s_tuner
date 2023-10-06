import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/repositories/tuning_repository.dart';
import 'list_instruments_state.dart';

class ListInstrumentsStateNotifier extends StateNotifier<ListInstrumentsState> {
  ListInstrumentsStateNotifier({required this.repository})
      : super(InitialListInstrumentsState());
  final TuningRepository repository;

  void loadInstruments() async {
    state = LoadingListInstrumentsState();

    try {
      final result = await repository.getInstruments();
      state = SuccessListInstrumentsState(data: result);
    } catch (e) {
      state = FailureListInstrumentsState(errorMessage: 'errorMessage');
    }
  }
}
