import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColoredListView extends StatefulWidget {
  const ColoredListView({
    super.key,
  });

  @override
  State<ColoredListView> createState() => _ColoredListViewState();
}

class _ColoredListViewState extends State<ColoredListView> {
  int currentIndexOfUserCLicked = -1;

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
                BlocProvider.of<AddNoteCubit>(context).colorOfItem =
                    kColors[index];
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

class ColoredItem extends StatelessWidget {
  const ColoredItem({
    Key? key,
    required this.isActive,
    required this.color,
  }) : super(key: key);

  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}
