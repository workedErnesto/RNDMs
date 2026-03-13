import 'package:lucky_wheel_clean_architecture/features/settings/domain/interface_repository/interface_settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const speedKey = 'speed';
const spinTypeKey = 'spin_type';
const themeKey = 'theme';

class SettingsRepository implements ISettingsReposirory {
  final SharedPreferences _prefs;

  SettingsRepository({required SharedPreferences prefs}) : _prefs = prefs;
  @override
  String getSpeed() => _prefs.getString(speedKey) ?? 'normal';

  @override
  String getSpinType() => _prefs.getString(spinTypeKey) ?? 'wheel';

  @override
  String getTheme() => _prefs.getString(themeKey) ?? 'dark';

  @override
  void setSpeed(String speed) => _prefs.setString(speedKey, speed);

  @override
  void setSpinType(String spinType) => _prefs.setString(spinTypeKey, spinType);

  @override
  void setTheme(String theme) => _prefs.setString(themeKey, theme);
}
