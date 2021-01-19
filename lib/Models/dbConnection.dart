import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'NoteModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database = openDatabase(

    join(await getDatabasesPath(), 'notes_database.db'),

    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE notes(id INTEGER PRIMARY KEY, headline TEXT, note TEXT,date TEXT)",
      );
    },
    version: 1,
  );

  Future<void> insertNote(Note note) async {
    final Database db = await database;

    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Note>> notes() async {
    // Get a reference to the database.
    final Database db = await database;

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

  Future<void> updateNote(Note note) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'notes',
      note.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'notes',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
  // // Insert a dog into the database.
  // await insertNote(fido);
  //
  // // Print the list of dogs (only Fido for now).
  // print(await notes());

  // Update Fido's age and save it to the database.
  // fido = Note(
  //   id: fido.id,
  //   headline: fido.headline,
  //   note: fido.note,
  //   date: 'tomorrow'
  // );
  //
  // await updateNote(fido);
  //
  // // Print Fido's updated information.
  // print(await notes());
  //
  // Delete Fido from the database.
  // await deleteNote(fido.id);
  //
  // // Print the list of dogs (empty).
  // print(await notes());
}
