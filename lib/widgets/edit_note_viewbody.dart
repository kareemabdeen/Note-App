import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/widgets/edit_note_colored_list.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../helper/formatdate.dart';
import '../models/note_model.dart';
import 'custom_appbar.dart';
import 'custom_textfield.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? content, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 43,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icons: Icons.check,
            onTap: () {
              saveCurrentChangesOfNote(context);

              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            text: title ?? widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            text: content ?? widget.note.subtitle,
            maxlines: 5,
          ),
          const SizedBox(
            height: 16 * 1.5,
          ),
          EditNoteColoredListview(
            note: widget.note,
          ),
        ],
      ),
    );
  }

  Future<void> saveCurrentChangesOfNote(BuildContext context) async {
    String formattedDate = getCurrentFormattedDate();
    widget.note.updateAll(title: title, subtitle: content, date: formattedDate);
    BlocProvider.of<NotesCubit>(context)
        .fetchNotesFromDataBase(); // to update the page again by loading the new updates again
  }
}
