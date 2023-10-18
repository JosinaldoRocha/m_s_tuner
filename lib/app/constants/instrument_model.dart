import '../data/models/instrument_model.dart';
import '../data/models/note_model.dart';
import '../data/models/tuning_model.dart';
import '../data/models/tuning_types_model.dart';

InstrumentModel initialInstrument = InstrumentModel(
  id: 'violao',
  title: 'Violão',
  tuningTypes: [
    TuningTypesModel(
      id: 'tuningStandard',
      title: 'Standard',
      tuning: TuningModel(
        id: 'standartViolao',
        instrumentId: 'violao',
        tuningTypeId: 'tuningStandard',
        notes: [
          NoteModel(id: 'mizao', title: 'E'),
          NoteModel(id: 'la', title: 'A'),
          NoteModel(id: 're', title: 'D'),
          NoteModel(id: 'sol', title: 'G'),
          NoteModel(id: 'si', title: 'B'),
          NoteModel(id: 'mi', title: 'E'),
        ],
      ),
    ),
    TuningTypesModel(
      id: 'tuningStandard',
      title: 'Stan',
      tuning: TuningModel(
        id: 'standartViolao',
        instrumentId: 'violao',
        tuningTypeId: 'tuningStandard',
        notes: [
          NoteModel(id: 'mizao', title: 'E'),
          NoteModel(id: 'la', title: 'A'),
          NoteModel(id: 're', title: 'D'),
          NoteModel(id: 'sol', title: 'G'),
          NoteModel(id: 'si', title: 'B'),
          NoteModel(id: 'mi', title: 'E'),
        ],
      ),
    ),
  ],
);
