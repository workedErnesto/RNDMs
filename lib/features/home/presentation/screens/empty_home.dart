import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/widgets/widgets.dart';

class EmptyHome extends StatelessWidget {
  const EmptyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FortuneImg(),
            SizedBox(height: 10),
            HasFortuneTitle(),
            HasFortuneSubTitle(),
            SizedBox(height: 20),
            CreateFortuneButton(),
          ],
        ),
      ),
    );
  }
}
