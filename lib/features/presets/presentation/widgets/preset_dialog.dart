import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/common_button.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/slice_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/colors_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/temp_preset_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/widgets/widgets.dart';

class PresetDialog extends ConsumerStatefulWidget {
  final Preset preset;
  final Slice? slice;
  const PresetDialog({super.key, required this.preset, this.slice});

  @override
  ConsumerState<PresetDialog> createState() => _PresetDialogState();
}

class _PresetDialogState extends ConsumerState<PresetDialog> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late Color _foregroundColor;
  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.slice?.label ?? '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _foregroundColor =
        widget.slice?.foregroundColor ?? ref.watch(foregroundColorProvider);
    _backgroundColor =
        widget.slice?.backgroundColor ?? ref.watch(backgroundColorProvider);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Dialog(
        backgroundColor: theme.scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormFieldItem(
                  validatorMsg: "введите название!",
                  hintText: "название секции",
                  onChangedValue: (_) {},
                  controller: _controller,
                ),
                SizedBox(height: 15),
                ColorPickerButton(
                  label: "цвет фона:",
                  defaultColor: _backgroundColor,
                  changeColor: (color) =>
                      setState(() => _backgroundColor = color),
                ),
                SizedBox(height: 15),
                ColorPickerButton(
                  label: "цвет текста:",
                  defaultColor: _foregroundColor,
                  changeColor: (color) =>
                      setState(() => _foregroundColor = color),
                ),
                SizedBox(height: 15),
                CommonButton(
                  label: widget.slice == null ? "добавить" : "сохранить",
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    final slice = Slice(
                      id:
                          widget.slice?.id ??
                          ref.read(tempPresetProvider.notifier).getMaxSliceID(),
                      label: _controller.text,
                      backgroundColor: _backgroundColor,
                      foregroundColor: _foregroundColor,
                    );

                    widget.slice == null
                        ? ref.read(tempPresetProvider.notifier).addSlice(slice)
                        : ref
                              .read(tempPresetProvider.notifier)
                              .updateSlice(slice);

                    ref.read(foregroundColorProvider.notifier).reset();
                    ref.read(backgroundColorProvider.notifier).reset();

                    Navigator.pop(context);
                  },
                  foregroundColor: Colors.white,
                  backgroundColor: theme.colorScheme.secondary,
                  height: 60,
                ),
                SizedBox(height: 15),
                CommonButton(
                  label: "отменить",
                  onPressed: () => Navigator.pop(context),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
