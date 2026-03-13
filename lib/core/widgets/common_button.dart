import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final Color foregroundColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double? height;
  const CommonButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.foregroundColor,
    required this.backgroundColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        minimumSize: Size.fromHeight(height ?? 65),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          fontFamily: "soyuz",
          color: foregroundColor,
        ),
      ),
    );
  }
}
