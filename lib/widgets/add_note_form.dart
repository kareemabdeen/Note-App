import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/widgets/colored_listview.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../helper/formatdate.dart';
import '../models/note_model.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, subtitle;
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onsaved: (value) {
              title = value;
            },
            text: 'title',
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onsaved: (value) {
              subtitle = value;
            },
            text: 'content',
            maxlines: 5,
          ),
          const SizedBox( 
            height: 32,
          ),
          const ColoredListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (globalKey.currentState!.validate()) {
                    globalKey.currentState!.save();

                    createAndAddNote(context);
                  } else {
                    autovalidateMode = AutovalidateMode
                        .always; // Used to auto-validate [Form] and [FormField] even without user interaction.
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  void createAndAddNote(BuildContext context) {
    String formattedDate = getCurrentFormattedDate();
    NoteModel note = NoteModel(
      title: title!,
      subtitle: subtitle!,
      date: formattedDate,
      color: Colors.black.value,
    );
    BlocProvider.of<AddNoteCubit>(context).addNote(note);
  }
}
