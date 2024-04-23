import 'package:flutter/material.dart';

import 'custom_search_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icons, this.onTap});

  final String title;
  final IconData icons;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        const Spacer(),
        CustomButtonWithIcon(
          onTap: onTap,
          icons: icons,
        ),
      ],
    );
  }
}
