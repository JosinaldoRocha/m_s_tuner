import 'package:flutter/material.dart';

class NoteModel {
  String id;
  String title;
  int octave;
  double minimumFrequency;
  double maximumFrequency;
  double standardFrequency;
  String? frequencyStatus;

  NoteModel({
    required this.id,
    required this.title,
    required this.octave,
    required this.minimumFrequency,
    required this.maximumFrequency,
    required this.standardFrequency,
    this.frequencyStatus,
  });

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
