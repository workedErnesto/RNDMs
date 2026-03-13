import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/slice_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/widgets/widgets.dart';

class ListViewSlices extends StatelessWidget {
  final List<Slice> slices;
  final Preset preset;
  const ListViewSlices({super.key, required this.slices, required this.preset});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: slices.length,
      itemBuilder: (context, index) {
        return ListItemSlices(slice: slices[index], preset: preset);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 8);
      },
    );
  }
}
