import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/routes/router.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/presets_list_provider.dart';

class SearchBarPresets extends ConsumerWidget {
  const SearchBarPresets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      color: theme.colorScheme.secondary.withOpacity(0.09),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: theme.scaffoldBackgroundColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextSelectionTheme(
                data: TextSelectionThemeData(
                  selectionColor: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
                child: TextField(
                  onChanged: (value) => ref
                      .read(presetsListProvider.notifier)
                      .searchPresetsByName(value),
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  maxLength: 25,
                  cursorColor: theme.colorScheme.onSurface,
                  decoration: InputDecoration(
                    fillColor: theme.scaffoldBackgroundColor,
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    counterText: "",
                    hintText: "Поиск",
                    prefixIcon: Icon(
                      Icons.search,
                      size: 35,
                      color: theme.colorScheme.onSurface,
                    ),
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 20,
                    fontFamily: "Soyuz",
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => context.router.root.push(PresetEditorRoute()),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
                backgroundColor: theme.colorScheme.secondary.withOpacity(0.4),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: theme.colorScheme.onSurface, size: 14),
                  Text(
                    "пресет",
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 14,
                      fontFamily: "Soyuz",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
