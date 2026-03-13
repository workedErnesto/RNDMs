import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:lucky_wheel_clean_architecture/app.dart';
import 'package:get_it/get_it.dart';
import 'package:lucky_wheel_clean_architecture/features/history/data/repository/history_repository.dart';
import 'package:lucky_wheel_clean_architecture/features/history/domain/models/history_item_model.dart';
import 'package:lucky_wheel_clean_architecture/features/history/domain/repository/history_interface_repository.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/data/repository/presets_repository.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/interface_repository/interface_presets_repository.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/preset_model.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/slice_model.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/data/repository/settings_repository.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/domain/interface_repository/interface_settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(prefs);
  GetIt.I.registerLazySingleton<ISettingsReposirory>(
    () => SettingsRepository(prefs: prefs),
  );

  await Hive.initFlutter();
  Hive.registerAdapter(PresetAdapter());
  Hive.registerAdapter(SliceAdapter());
  Hive.registerAdapter(HistoryItemAdapter());
  final presetsBox = await Hive.openBox<Preset>('presets_box');
  final historyBox = await Hive.openBox<HistoryItem>('history_box');

  GetIt.I.registerLazySingleton<IPresetsRepository>(
    () => PresetsRepository(presetsBox: presetsBox),
  );
  GetIt.I.registerLazySingleton<IHistoryRepository>(
    () => HistoryRepository(historyBox: historyBox),
  );

  runApp(ProviderScope(child: WheelApp()));
}
