import 'package:flutter/material.dart';

class NoteModel {
  String id;
  String title;
  int? index;
  int octave;
  double minimumFrequency;
  double maximumFrequency;
  double standardFrequency;
  String? frequencyStatus;

  NoteModel({
    required this.id,
    required this.title,
    this.index,
    required this.octave,
    required this.minimumFrequency,
    required this.maximumFrequency,
    required this.standardFrequency,
    this.frequencyStatus,
  });

  int get getIndex {
    switch (title) {
      case 'C':
        index = 0;
      case 'C#':
        index = 1;
      case 'D':
        index = 2;
      case 'D#':
        index = 3;
      case 'E':
        index = 4;
      case 'F':
        index = 5;
      case 'F#':
        index = 6;
      case 'G':
        index = 7;
      case 'G#':
        index = 8;
      case 'A':
        index = 9;
      case 'A#':
        index = 10;
      default:
        index = 11;
    }
    return index!;
  }

  String noteTuning(double? frequency) {
    if (frequency != null) {
      if (frequency < standardFrequency - 0.5) {
        frequencyStatus = 'Low';
      } else if (frequency > standardFrequency + 0.5) {
        frequencyStatus = 'High';
      } else {
        frequencyStatus = 'Is tune';
      }
    }
    return frequencyStatus!;
  }

  Color get color {
    if (frequencyStatus == 'Low') {
      return const Color(0xFFB7B6F9);
    } else if (frequencyStatus == 'High') {
      return const Color(0xFFEEB440);
    } else {
      return const Color(0xFF6CE8DC);
    }
  }
}
