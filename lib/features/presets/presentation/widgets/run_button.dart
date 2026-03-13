import 'package:flutter/material.dart';

class RunButton extends StatelessWidget {
  const RunButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {},
      icon: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        fixedSize: Size(56, 56),
        backgroundColor: Colors.green,
      ),
    );
  }
}
