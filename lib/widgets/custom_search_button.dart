import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({super.key, required this.icons, this.onTap});

  final IconData icons;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icons,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
