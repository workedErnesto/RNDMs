import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/routes/router.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/static_lucky_wheel.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/providers/history_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/presets_list_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/temp_preset_provider.dart';

class ListItemPresets extends ConsumerWidget {
  final Preset preset;
  const ListItemPresets({super.key, required this.preset});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    int spinCount = ref.watch(
      historyProvider.select(
        (history) => ref.read(historyProvider.notifier).getSpinCount(preset.id),
      ),
    );
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: preset.isPrimaryPreset
            ? theme.colorScheme.secondary.withOpacity(0.2)
            : theme.colorScheme.secondary.withOpacity(0.05),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        elevation: 0,
      ),
      onPressed: () => ref
          .read(presetsListProvider.notifier)
          .updatePreset(preset.copyWith(isPrimaryPreset: true)),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                StaticLuckyWheel(slices: preset.slices),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        preset.name,
                        style: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 22,
                          fontFamily: "Soyuz",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "кол-во вращений: ${spinCount.toString()}",
                        style: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontSize: 14,
                          fontFamily: "Soyuz",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  ref
                      .read(tempPresetProvider.notifier)
                      .updateTempPreset(preset);
                  context.router.root.push(PresetEditorRoute());
                },
                icon: Icon(
                  Icons.edit,
                  color: theme.colorScheme.onSurface,
                  size: 30,
                ),
              ),
              SizedBox(width: 10),
              IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () =>
                    ref.read(presetsListProvider.notifier).removePreset(preset),

                icon: Icon(
                  Icons.delete,
                  color: theme.colorScheme.onSurface,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
