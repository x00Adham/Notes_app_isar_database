import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notice_app_isar/models/note.dart';
import 'package:notice_app_isar/models/note_database.dart';
import 'package:provider/provider.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key, required this.note});

  final Note note;

  late final TextEditingController _noteController = TextEditingController(
    text: note.content,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: () {
          context.read<NoteDatabase>().addNoteContent(
            note.id,
            _noteController.text,
          );
          FocusScope.of(context).unfocus();
        },
        child: const Icon(Icons.bookmark_add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                note.title,
                style: GoogleFonts.dmSerifText(
                  fontSize: 48,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _noteController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(
                  hintText: "Start writing your note...",
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
