import 'package:m_s_afinador/app/data/models/note_model.dart';
import 'package:m_s_afinador/app/data/models/tuning_model.dart';
import 'package:m_s_afinador/app/data/models/tuning_types_model.dart';
import '../models/instrument_model.dart';

class TuningRepository {
  final _tuningViolao = [
    // TuningTypesModel(
    //   id: 'tuningOpenD',
    //   title: 'Open D',
    //   tunings: [],
    // ),
    // TuningTypesModel(
    //   id: 'tuningOpenC',
    //   title: 'Open C',
    //   tunings: [],
    // ),
    // TuningTypesModel(
    //   id: 'tuningOpenB',
    //   title: 'Open B',
    //   tunings: [],
    // ),
    TuningTypesModel(
      id: 'tuningOpenA',
      title: 'Open A',
      tuning: [
        NoteModel(id: 'mizao', title: 'E'),
        NoteModel(id: 'la', title: 'A'),
        NoteModel(id: 'mi', title: 'E'),
        NoteModel(id: 'la', title: 'A'),
        NoteModel(id: 'doSustenido', title: 'C#'),
        NoteModel(id: 'mi', title: 'E'),
      ],
    ),
    TuningTypesModel(
      id: 'tuningStandard',
      title: 'Standard',
      tuning: [
        NoteModel(id: 'mizao', title: 'E1'),
        NoteModel(id: 'la', title: 'A'),
        NoteModel(id: 're', title: 'D'),
        NoteModel(id: 'sol', title: 'G'),
        NoteModel(id: 'si', title: 'B'),
        NoteModel(id: 'mi', title: 'E3'),
      ],
    ),
    TuningTypesModel(
      id: 'tuningDropD',
      title: 'Drop D',
      tuning: [
        NoteModel(id: 're', title: 'D'),
        NoteModel(id: 'la', title: 'A'),
        NoteModel(id: 're', title: 'D'),
        NoteModel(id: 'sol', title: 'G'),
        NoteModel(id: 'si', title: 'B'),
        NoteModel(id: 'mi', title: 'E'),
      ],
    ),
    // TuningTypesModel(
    //   id: 'tuningDropC',
    //   title: 'Drop C',
    //   tunings: [],
    // ),
    // TuningTypesModel(
    //   id: 'tuningDropB',
    //   title: 'Drop B',
    //   tunings: [],
    // ),
    // TuningTypesModel(
    //   id: 'tuningDropA',
    //   title: 'Drop A',
    //   tunings: [],
    // ),
  ];

  Future<TuningModel> getTunings(String? instrumentId) async {
    await Future.delayed(const Duration(milliseconds: 100));

    List<TuningModel> tuning = [
      // TuningModel(
      //   id: 'standardViolaoTuning',
      //   instrumentId: 'violao',
      //   tuningTypeId: 'standard',
      //   //tuning: ['E', 'A', 'D', 'G', 'B', 'E'],
      // ),
      // TuningModel(
      //   id: 'standardguitarraTuning',
      //   instrumentId: 'guitarra',
      //   tuningTypeId: 'standard',
      //   // tuning: ['E', 'E', 'D', 'G', 'B', 'E'],
      // ),
      // TuningModel(
      //   id: 'standardContrabaixoTuning',
      //   instrumentId: 'contrabaixo',
      //   tuningTypeId: 'standard',
      //   // tuning: ['E', 'A', 'D', 'G'],
      // ),
    ];
    if (instrumentId != null) {
      return tuning
          .firstWhere((element) => element.instrumentId == instrumentId);
    } else {
      return tuning.firstWhere((element) => element.instrumentId == 'violao');
    }
  }

  Future<List<TuningTypesModel>> tuningTypes() async {
    return [
      // TuningTypesModel(id: 'tuningOpenD', title: 'Open D'),
      // TuningTypesModel(id: 'tuningOpenC', title: 'Open C'),
      // TuningTypesModel(id: 'tuningOpenB', title: 'Open B'),
      // TuningTypesModel(id: 'tuningOpenA', title: 'Open A'),
      // TuningTypesModel(id: 'tuningStandard', title: 'Standard'),
      // TuningTypesModel(id: 'tuningDropD', title: 'Drop D'),
      // TuningTypesModel(id: 'tuningDropC', title: 'Drop C'),
      // TuningTypesModel(id: 'tuningDropB', title: 'Drop B'),
      // TuningTypesModel(id: 'tuningDropA', title: 'Drop A'),
    ];
  }

  Future<List<InstrumentModel>> getInstruments() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      InstrumentModel(
        id: 'guitarra',
        title: 'Guitarra',
        tuningTypes: _tuningViolao,
      ),
      InstrumentModel(
        id: 'violao',
        title: 'Violão',
        tuningTypes: _tuningViolao,
      ),
      InstrumentModel(
        id: 'contrabaixo',
        title: 'Contrabaixo',
        tuningTypes: [
          TuningTypesModel(
            id: 'tuningStandard',
            title: 'Standard',
            tuning: [
              NoteModel(id: 'mizao', title: 'E'),
              NoteModel(id: 'la', title: 'A'),
              NoteModel(id: 're', title: 'D'),
              NoteModel(id: 'sol', title: 'G'),
            ],
          ),
          TuningTypesModel(
            id: 'tuningOpenA',
            title: 'Open A',
            tuning: [
              NoteModel(id: 'la', title: 'A'),
              NoteModel(id: 'mi', title: 'E'),
              NoteModel(id: 're', title: 'D'),
              NoteModel(id: 'sol', title: 'G'),
            ],
          ),
        ],
      ),
    ];
  }
}
