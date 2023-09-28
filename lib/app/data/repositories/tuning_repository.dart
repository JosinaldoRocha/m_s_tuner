import 'package:m_s_afinador/app/data/models/instrument_model.dart';
import 'package:m_s_afinador/app/data/models/tuning_model.dart';
import 'package:m_s_afinador/app/data/models/tuning_types_model.dart';

class TuningRepository {
  List<TuningModel> items = [];

  Future<List<TuningModel>> getAllTunings(String? chord) async {
    await Future.delayed(const Duration(seconds: 2));

    final standart = [
      TuningModel(id: '01', title: 'E'),
      TuningModel(id: '02', title: 'A'),
      TuningModel(id: '03', title: 'D'),
      TuningModel(id: '04', title: 'G'),
      TuningModel(id: '05', title: 'B'),
      TuningModel(id: '06', title: 'E'),
    ];
    final dropD = [
      TuningModel(id: '01', title: 'D'),
      TuningModel(id: '02', title: 'A'),
      TuningModel(id: '03', title: 'D'),
      TuningModel(id: '04', title: 'G'),
      TuningModel(id: '05', title: 'B'),
      TuningModel(id: '06', title: 'E'),
    ];

    if (chord != null) {
      if (chord == 'dropD') {
        items = dropD;
      } else {
        items = standart;
      }
    }
    return items;
  }

  Future<List<TuningTypesModel>> tuningTypes() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      TuningTypesModel(id: 'tuningOpenD', title: 'Open D'),
      TuningTypesModel(id: 'tuningOpenC', title: 'Open C'),
      TuningTypesModel(id: 'tuningOpenB', title: 'Open B'),
      TuningTypesModel(id: 'tuningOpenA', title: 'Open A'),
      TuningTypesModel(id: 'tuningStandard', title: 'Standard'),
      TuningTypesModel(id: 'tuningDropD', title: 'Drop D'),
      TuningTypesModel(id: 'tuningDropC', title: 'Drop C'),
      TuningTypesModel(id: 'tuningDropB', title: 'Drop B'),
      TuningTypesModel(id: 'tuningDropA', title: 'Drop A'),
    ];
  }

  Future<List<InstrumentModel>> getAllInstruments() async {
    return [
      InstrumentModel(id: 'instrument01', title: 'Guitarra'),
      InstrumentModel(id: 'instrument02', title: 'Violão'),
      InstrumentModel(id: 'instrument03', title: 'Contrabaixo'),
    ];
  }
}
