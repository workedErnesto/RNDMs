import 'package:flutter/material.dart';

class ListItemButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const ListItemButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 43, 65, 130),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 30),
    );
  }
}
