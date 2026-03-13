import 'package:flutter/material.dart';

class AboutUsBlock extends StatelessWidget {
  const AboutUsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "основное:",
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 30,
            fontFamily: "Soyuz",
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: theme.colorScheme.primary.withOpacity(0.05),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "RNDMs - больше чем просто рандом. ",
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 20,
                    fontFamily: "mont",
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(
                  text:
                      "это твой личный пульт управления случаем. создавай кастомные пресеты, настраивай приложение, отслеживай историю и визуализируй удачу так, как удобно тебе.",
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 20,
                    fontFamily: "mont",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
