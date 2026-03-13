import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/presets_list_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/widgets/widgets.dart';

class ListViewPresets extends ConsumerWidget {
  const ListViewPresets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    List<Preset> listPreset = ref.watch(presetsListProvider);
    return ListView.builder(
      itemCount: listPreset.length,
      itemBuilder: (context, index) {
        return Card(
          color: theme.scaffoldBackgroundColor,
          child: ListItemPresets(preset: listPreset[index]),
        );
      },
    );
  }
}
