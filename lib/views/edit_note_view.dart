import 'package:flutter/material.dart';

import '../models/note_model.dart';
import '../widgets/edit_note_viewbody.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: EditNoteViewBody(
          note: note,
        ),
      ),
    );
  }
}
