import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notice_app_isar/models/note.dart';
import 'package:notice_app_isar/models/note_database.dart';
import 'package:notice_app_isar/widgets/mydrawer.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),

      drawer: const Mydrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
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
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () => updateNotes(note),
                        icon: const Icon(Icons.edit),
                      ),
                      //delete button
                      IconButton(
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () => deleteNotes(note.id),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
