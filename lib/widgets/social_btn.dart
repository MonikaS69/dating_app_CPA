import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Widget iconWidget; // Accepts either an Icon or an Image
  final Color color;

  const SocialButton({
    super.key,
    required this.iconWidget,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1),
      ),
      padding: EdgeInsets.all(10),
      child: iconWidget,
    );
  }
}
