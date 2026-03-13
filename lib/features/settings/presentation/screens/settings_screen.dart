import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/widgets/widgets.dart';

@RoutePage()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SpeedAnimationBlock(),
                  SizedBox(height: 15),
                  ThemeBlock(),
                  SizedBox(height: 15),
                  TypeAnimationBlock(),
                  SizedBox(height: 15),
                  HistoryButton(),
                  SizedBox(height: 15),
                  AboutAppButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
