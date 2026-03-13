import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/routes/router.dart';
import 'package:lucky_wheel_clean_architecture/core/themes/themes.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';

class WheelApp extends ConsumerStatefulWidget {
  const WheelApp({super.key});

  @override
  ConsumerState<WheelApp> createState() => _WheelAppState();
}

class _WheelAppState extends ConsumerState<WheelApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ref.watch(settingsProvider).isDarkTheme;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
