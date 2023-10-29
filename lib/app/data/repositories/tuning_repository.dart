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
        NoteModel(id: 'A2', title: 'A', octave: 2),
        NoteModel(id: 'E3', title: 'E', octave: 3),
        NoteModel(id: 'A3', title: 'A', octave: 3),
        NoteModel(id: 'C#4', title: 'C#', octave: 4),
        NoteModel(id: 'E4', title: 'E', octave: 4),
        NoteModel(id: 'A4', title: 'A', octave: 4),
      ],
    ),
    TuningTypesModel(
      id: 'tuningStandard',
      title: 'Standard',
      tuning: [
        NoteModel(id: 'E2', title: 'E', octave: 2),
        NoteModel(id: 'A2', title: 'A', octave: 2),
        NoteModel(id: 'D3', title: 'D', octave: 3),
        NoteModel(id: 'G3', title: 'G', octave: 3),
        NoteModel(id: 'B3', title: 'B', octave: 3),
        NoteModel(id: 'E4', title: 'E', octave: 4),
      ],
    ),
    TuningTypesModel(
      id: 'tuningDropD',
      title: 'Drop D',
      tuning: [
        NoteModel(id: 'D2', title: 'D', octave: 2),
        NoteModel(id: 'A2', title: 'A', octave: 2),
        NoteModel(id: 'D3', title: 'D', octave: 3),
        NoteModel(id: 'G3', title: 'G', octave: 3),
        NoteModel(id: 'B3', title: 'B', octave: 3),
        NoteModel(id: 'E4', title: 'E', octave: 4),
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
              NoteModel(id: 'E1', title: 'E', octave: 1),
              NoteModel(id: 'A1', title: 'A', octave: 1),
              NoteModel(id: 'D2', title: 'D', octave: 2),
              NoteModel(id: 'G2', title: 'G', octave: 2),
            ],
          ),
          TuningTypesModel(
            id: 'tuningDropD',
            title: 'Drop D',
            tuning: [
              NoteModel(id: 'D1', title: 'D', octave: 1),
              NoteModel(id: 'A1', title: 'A', octave: 1),
              NoteModel(id: 'D2', title: 'D', octave: 2),
              NoteModel(id: 'G2', title: 'G', octave: 2),
            ],
          ),
        ],
      ),
    ];
  }
}
