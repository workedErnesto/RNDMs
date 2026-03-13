import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/presets_list_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/widgets/widgets.dart';

@RoutePage()
class ListPresetsScreen extends ConsumerWidget {
  const ListPresetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presets = ref.watch(presetsListProvider);
    return Scaffold(
      body: Column(
        children: [
          SearchBarPresets(),
          Expanded(
            child: presets.isEmpty
                ? StubEmptyPresets(
                    isSearchStub: !ref
                        .read(presetsListProvider.notifier)
                        .isEmptyPresets(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListViewPresets(),
                  ),
          ),
        ],
      ),
    );
  }
}
