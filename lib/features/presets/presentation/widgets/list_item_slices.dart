import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/slice_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/temp_preset_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/widgets/widgets.dart';

class ListItemSlices extends ConsumerStatefulWidget {
  final Preset preset;
  final Slice slice;
  const ListItemSlices({super.key, required this.slice, required this.preset});

  @override
  ConsumerState<ListItemSlices> createState() => _ListItemSlicesState();
}

class _ListItemSlicesState extends ConsumerState<ListItemSlices> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.slice.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) =>
              PresetDialog(slice: widget.slice, preset: widget.preset),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.slice.label,
              style: TextStyle(
                color: widget.slice.foregroundColor,
                fontFamily: "Soyuz",
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          SizedBox(width: 10),
          ListItemButton(
            icon: Icons.delete,
            
            onPressed: () {
              if (widget.preset.slices.length <= 2) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => DialogError(
                    errorLabel: 'в пресете должно быть минимум 2 секции',
                  ),
                );
              } else {
                ref.read(tempPresetProvider.notifier).deleteSlice(widget.slice);
              }
            },
          ),
        ],
      ),
    );
  }
}
