import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notice_app_isar/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  //initializing the database
  Future<void> init() async {
    //initilize the directory
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  //current note list
  List<Note> currentNoteList = [];

  //adding newnote to the database
  Future<void> addNote(String text) async {
    final newNote = Note()..title = text;
    if (text.isNotEmpty) {
  await isar.writeTxn(() => isar.notes.put(newNote));
  fetchNote();
}
  }

  //reading the database
  Future<void> fetchNote() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNoteList.clear();
    currentNoteList.addAll(fetchedNotes);
    notifyListeners();
  }

  //updating the database
  Future<void> updateNote(int id, String newtext) async {
    //get the oldnote from its id
    final oldNote = await isar.notes.get(id);
    //check if it null
    if (oldNote != null) {
      //add the title of the newnote to oldnote
      oldNote.title = newtext;
      //put the note to database
      await isar.writeTxn(() => isar.notes.put(oldNote));
      await fetchNote();
    }
  }
  //deleting the database

  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNote();
     // Ensure the UI is updated after deletion
  }
}
