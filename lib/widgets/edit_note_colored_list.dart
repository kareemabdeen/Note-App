import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colored_listview.dart';

class EditNoteColoredListview extends StatefulWidget {
  const EditNoteColoredListview({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditNoteColoredListview> createState() =>
      _EditNoteColoredListviewState();
}

class _EditNoteColoredListviewState extends State<EditNoteColoredListview> {
  late int currentIndexOfUserCLicked;
  @override
  void initState() {
    currentIndexOfUserCLicked = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndexOfUserCLicked = index;
                widget.note.color = kColors[currentIndexOfUserCLicked].value;
                setState(() {});
              },
              child: ColoredItem(
                color: kColors[index],
                isActive: currentIndexOfUserCLicked == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
