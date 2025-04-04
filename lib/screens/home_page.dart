 
import 'package:flutter/material.dart';
import 'package:notice_app_isar/models/note.dart';
import 'package:notice_app_isar/models/note_database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch data on startup
    context.read<NoteDatabase>().fetchNote();
  }

  // Create notes
  void createNote() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: TextField(controller: textController),
            actions: [
              MaterialButton(
                onPressed: () {
                  context.read<NoteDatabase>().addNote(textController.text);
                  // Clear the text field
                  textController.clear();
                  Navigator.pop(context);
                },
                child: const Text('create'),
              ),
            ],
          ),
    );
  }

  //update notes
  void updateNotes(Note note) {
    textController.text = note.title;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: TextField(controller: textController),
            actions: [
              MaterialButton(
                onPressed: () {
                  context.read<NoteDatabase>().updateNote(
                    note.id,
                    textController.text,
                  );
                  // Clear the text field
                  textController.clear();
                  Navigator.pop(context);
                },
                child: const Text('update'),
              ),
            ],
          ),
    );
  }

  //delete notes
  void deleteNotes(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    // Read notes
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = noteDatabase.currentNoteList;

    return Scaffold(
      appBar: AppBar(title: const Text("Notes"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder: (context, index) {
          final note = currentNotes[index];
          //return list tile
          return ListTile(
            title: Text(note.title),
            //display the note title
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                //edit button
                IconButton(
                  onPressed: () => updateNotes(note),
                  icon: const Icon(Icons.edit),
                ),
                //delete button
                IconButton(
                  onPressed: () => deleteNotes(note.id),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
