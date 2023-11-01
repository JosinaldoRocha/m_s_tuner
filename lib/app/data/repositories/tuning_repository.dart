import 'package:m_s_afinador/app/data/models/note_model.dart';

class TuningRepository {
  List<NoteModel> guitarStandart = [];

  List<NoteModel> guitarOpenA = [
    NoteModel(
      id: 'A2',
      title: 'A',
      octave: 2,
      minimumFrequency: 106.91,
      maximumFrequency: 113.26,
      standardFrequency: 110.00,
    ),
    NoteModel(
      id: 'E3',
      title: 'E',
      octave: 3,
      minimumFrequency: 160.18,
      maximumFrequency: 164.81,
      standardFrequency: 110.00,
    ),
    NoteModel(
      id: 'A3',
      title: 'A',
      octave: 3,
      minimumFrequency: 213.82,
      maximumFrequency: 226.53,
      standardFrequency: 220.00,
    ),
    NoteModel(
      id: 'C#4',
      title: 'C#',
      octave: 4,
      minimumFrequency: 269.40,
      maximumFrequency: 285.41,
      standardFrequency: 277.18,
    ),
    NoteModel(
      id: 'E4',
      title: 'E',
      octave: 4,
      minimumFrequency: 320.38,
      maximumFrequency: 339.42,
      standardFrequency: 329.63,
    ),
    NoteModel(
      id: 'A4',
      title: 'A',
      octave: 4,
      minimumFrequency: 427.65,
      maximumFrequency: 453.07,
      standardFrequency: 440.00,
    ),
  ];
  List<NoteModel> guitarDropD = [];
}
