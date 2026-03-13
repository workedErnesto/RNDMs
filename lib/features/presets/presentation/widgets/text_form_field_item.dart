import 'package:flutter/material.dart';

class TextFormFieldItem extends StatelessWidget {
  final String validatorMsg;
  final String hintText;
  final String? initLabel;
  final ValueChanged<String> onChangedValue;
  final TextEditingController? controller;
  const TextFormFieldItem({
    super.key,
    required this.validatorMsg,
    required this.hintText,
    this.initLabel,
    this.controller,
    required this.onChangedValue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      // elevation: 1,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: controller,
        onChanged: (value) => onChangedValue(value),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMsg;
          }
          return null;
        },
        autocorrect: false,
        maxLength: 30,
        keyboardType: TextInputType.text,
        cursorColor: theme.colorScheme.onSurface,
        cursorHeight: 22,
        decoration: InputDecoration(
          errorStyle: TextStyle(fontFamily: "Soyuz", color: Colors.red),
          hintText: hintText,
          hintStyle: TextStyle(
            color: theme.colorScheme.onSurface.withOpacity(0.5),
          ),
          counterText: "",
          filled: true,
          fillColor: theme.colorScheme.primary.withOpacity(0.13),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        ),
        style: TextStyle(
          color: theme.colorScheme.onSurface,
          fontFamily: "Soyuz",
          fontSize: 22,
        ),
      ),
    );
  }
}
