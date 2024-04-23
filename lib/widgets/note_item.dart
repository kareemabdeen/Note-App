import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../models/note_model.dart';
import '../views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNotePage(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          bottom: 24,
      ),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                note.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Text(
                  note.subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ),
              trailing: IconButton(
                padding: const EdgeInsets.only(
                  right: 24,
                  bottom: 33,
                ),
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchNotesFromDataBase();
                },
                icon: const Icon(
                  Icons.delete,
                  size: 24 * 1.28,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 24,
              ),
              child: Text(
                note.date,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
