import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/features/about/presentation/widgets/widgets.dart';

class MyContactsBlock extends StatelessWidget {
  const MyContactsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "связь:",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "workedErnesto",
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 16,
                  fontFamily: "mont",
                  fontWeight: FontWeight.w900,
                ),
              ),
              ContactButton(
                url: 'https://github.com/workedErnesto',
                svgPictureName: 'github',
                label: 'GitHub',
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 8),
              Text(
                "only.worked.ernesto@gmail.com",
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 16,
                  fontFamily: "mont",
                  fontWeight: FontWeight.w900,
                ),
              ),
              ContactButton(
                email: 'only.worked.ernesto@gmail.com"',
                icon: Icons.mail_outline,
                label: 'Почта',
                foregroundColor: Colors.white,
                backgroundColor: theme.colorScheme.secondary,
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
