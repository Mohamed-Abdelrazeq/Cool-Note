class Note {
  final int id;
  final String headline;
  final String note;
  final String date;

  Note({this.id, this.headline,this.date,this.note});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'headline': headline,
      'date': date,
      'note': note,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, note: $note, date: $date, headline: $headline}';
  }
}