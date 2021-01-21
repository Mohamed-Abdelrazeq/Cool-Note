import 'package:flutter/cupertino.dart';

class Note {
  final int id;
  final String headline;
  final String note;
  final String date;
  final int colorId;

  Note({
              this.id,
    @required this.headline,
    @required this.date,
    @required this.note,
    @required this.colorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'headline': headline,
      'date': date,
      'note': note,
      'colorId': colorId,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, note: $note, date: $date, headline: $headline}';
  }
}
