import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/screens/screens.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/presets_list_provider.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasPresets = ref.watch(presetsListProvider).isNotEmpty;
    return hasPresets ? ReadyHome() : EmptyHome();
  }
}
