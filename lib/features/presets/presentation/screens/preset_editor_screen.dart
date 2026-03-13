import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/presets_list_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/providers/temp_preset_provider.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/widgets/widgets.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/providers/settings_provider.dart';

@RoutePage()
class PresetEditorScreen extends ConsumerStatefulWidget {
  const PresetEditorScreen({super.key});
  @override
  ConsumerState<PresetEditorScreen> createState() => _PresetEditorScreenState();
}

class _PresetEditorScreenState extends ConsumerState<PresetEditorScreen> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _nameTagretKey = GlobalKey();
  final _startTargetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tempPreset = ref.watch(tempPresetProvider);
    final presetsProvider = ref.read(presetsListProvider.notifier);

    final isWheel = ref.read(settingsProvider).isWheelType;

    _controller.text = ref.read(tempPresetProvider).name;

    final theme = Theme.of(context);
    return Scaffold(
      appBar: Header(
        label: 'пресет',
        actionLeading: BackButton(
          onPressed: () async {
            final isExit = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) => WarningError(
                warningLabel:
                    'вы точно уверены, что хотите выйти?\nпресет не будет сохранен.',
              ),
            );

            if (isExit == true) {
              context.router.maybePop();
              ref.read(tempPresetProvider.notifier).reset();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(key: _startTargetKey),
              TextFormFieldItem(
                key: _nameTagretKey,
                onChangedValue: (name) => ref
                    .read(tempPresetProvider.notifier)
                    .updateTempPreset(tempPreset.copyWith(name: name)),
                validatorMsg: "введите название пресета!",
                hintText: "название пресета",
                controller: _controller,
              ),
              SizedBox(height: 30),
              !isWheel
                  ? PresetFortuneBar(tempPreset: tempPreset, hasIndicitor: true)
                  : PresetFortuneWheel(
                      tempPreset: tempPreset,
                      hasIndicitor: true,
                    ),

              SizedBox(height: 10),
              Text(
                "секции:",
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontFamily: "Soyuz",
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 10),
              SliderTextSize(tempPreset),
              SizedBox(height: 10),
              ListViewSlices(slices: tempPreset.slices, preset: tempPreset),
              CommonButton(
                label: "+ секция",
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      PresetDialog(preset: tempPreset),
                ),
                foregroundColor: theme.colorScheme.onSurface,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.13),
              ),
              SizedBox(height: 15),
              CheckBoxIsPrimary(tempPreset: tempPreset),
              SizedBox(height: 15),
              CommonButton(
                label: "сохранить",
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    Scrollable.ensureVisible(_nameTagretKey.currentContext!);
                    return;
                  }
                  tempPreset.id == -1
                      ? presetsProvider.addPreset(
                          Preset(
                            id: presetsProvider.getMaxPresetID(),
                            name: _controller.text,
                            textSize: tempPreset.textSize,
                            slices: tempPreset.slices,
                            isPrimaryPreset: tempPreset.isPrimaryPreset,
                          ),
                        )
                      : presetsProvider.updatePreset(tempPreset);

                  ref.read(tempPresetProvider.notifier).reset();
                  context.router.maybePop();
                },
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 59, 93, 193),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
