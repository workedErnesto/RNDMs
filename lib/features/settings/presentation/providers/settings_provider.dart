import 'package:get_it/get_it.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/domain/interface_repository/interface_settings_repository.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/domain/models/user_settings_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

@riverpod
class Settings extends _$Settings {
  final _repository = GetIt.I<ISettingsReposirory>();

  @override
  UserSettings build() {
    final speed = _repository.getSpeed();
    final theme = _repository.getTheme();
    final spinType = _repository.getSpinType();

    return UserSettings(
      speed: Speed.fromString(speed),
      theme: Themes.fromString(theme),
      spinType: SpinTypes.fromString(spinType),
    );
  }

  void setSpeed(int value) {
    final speed = Speed.fromInt(value);
    _repository.setSpeed(speed.name);
    state = state.copyWith(speed: speed);
  }

  void setSpinType(int value) {
    final spinType = SpinTypes.fromInt(value);
    _repository.setSpinType(spinType.name);
    state = state.copyWith(spinType: spinType);
  }

  void setTheme(int value) {
    final theme = Themes.fromInt(value);
    _repository.setTheme(theme.name);
    state = state.copyWith(theme: theme);
  }
}
