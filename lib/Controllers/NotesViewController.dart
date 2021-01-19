import 'package:coolnote_app/Models/NoteModel.dart';
import 'package:coolnote_app/Models/dbConnection.dart';
import 'package:coolnote_app/Views/ComponentWidgets/NoteCard.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NotesViewController with ChangeNotifier{
  //Vars
  List<Widget> leftList = [];
  List<Widget> rightList = [];
  List<Widget> myNoteCards = [];

  Future<void> insertNote(Note note,Database database) async {
    final Database db = database;

    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    notifyListeners();
  }

  Future<void> updateNote(Note note,Database database) async {
    // Get a reference to the database.
    final db = database;

    // Update the given Dog.
    await db.update(
      'notes',
      note.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [note.id],
    );

    notifyListeners();

  }

  Future<void> deleteNote(int id,Database database) async {
    // Get a reference to the database.
    final db = database;

    // Remove the Dog from the database.
    await db.delete(
      'notes',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );

    notifyListeners();

  }

  Future<List<Note>> notes(Database database) async {
    // Get a reference to the database.
    final Database db = database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('notes');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        headline: maps[i]['headline'],
        date: maps[i]['date'],
        note: maps[i]['note'],
      );
    });
  }

  Future<List<Widget>> notesRow({double width, double height}) async {

    leftList.clear();
    rightList.clear();

    Database database = await dbConnection();
    List<Note> myNotes = await notes(database);

    print(myNotes.length);

    for (var i = 0; i < myNotes.length; i++) {
      if (myNotes[i].id % 2 == 0){
        leftList.add(NoteCard(
          width: width,
          height: height,
          color: Colors.greenAccent,
          date: myNotes[i].date,
          headline: myNotes[i].headline,
          id: myNotes[i].id,
          note: myNotes[i].note,
        ));
      }
      else {
        rightList.add(NoteCard(
          width: width,
          height: height,
          color: Colors.greenAccent,
          date: myNotes[i].date,
          headline: myNotes[i].headline,
          id: myNotes[i].id,
          note: myNotes[i].note,
        ));
      }
    }

    notifyListeners();

    myNoteCards = [
      Column(
        children: leftList,
      ),
      SizedBox(
        width: width * .04,
      ),
      Column(
        children: rightList,
      ),
    ];

    return [
      Column(
        children: leftList,
      ),
      SizedBox(
        width: width * .04,
      ),
      Column(
        children: rightList,
      ),
    ];

  }

}
