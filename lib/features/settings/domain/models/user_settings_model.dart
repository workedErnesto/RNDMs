enum Speed {
  slow,
  normal,
  fast;

  static Speed fromString(String value) {
    return Speed.values.firstWhere(
      (v) => v.name == value,
      orElse: () => Speed.normal,
    );
  }

  static Speed fromInt(int value) {
    return Speed.values.firstWhere(
      (v) => v.index == value,
      orElse: () => Speed.normal,
    );
  }
}

enum Themes {
  light,
  dark;

  static Themes fromString(String value) {
    return Themes.values.firstWhere(
      (v) => v.name == value,
      orElse: () => Themes.dark,
    );
  }

  static Themes fromInt(int value) {
    return Themes.values.firstWhere(
      (v) => v.index == value,
      orElse: () => Themes.dark,
    );
  }
}

enum SpinTypes {
  wheel,
  bar;

  static SpinTypes fromString(String value) {
    return SpinTypes.values.firstWhere(
      (v) => v.name == value,
      orElse: () => SpinTypes.wheel,
    );
  }

  static SpinTypes fromInt(int value) {
    return SpinTypes.values.firstWhere(
      (v) => v.index == value,
      orElse: () => SpinTypes.wheel,
    );
  }
}

class UserSettings {
  UserSettings({
    required Speed speed,
    required Themes theme,
    required SpinTypes spinType,
  }) : _speed = speed,
       _theme = theme,
       _spinType = spinType;

  final Speed _speed;
  final Themes _theme;
  final SpinTypes _spinType;

  UserSettings copyWith({Speed? speed, Themes? theme, SpinTypes? spinType}) {
    return UserSettings(
      speed: speed ?? _speed,
      theme: theme ?? _theme,
      spinType: spinType ?? _spinType,
    );
  }

  bool get isDarkTheme => Themes.dark == _theme ? true : false;

  bool get isWheelType => SpinTypes.wheel == _spinType ? true : false;

  SpinTypes get getSpinType => _spinType;

  Speed get getSpeedType => _speed;

  Themes get getThemeType => _theme;

  int get getSpeedQuantity {
    switch (_speed) {
      case Speed.slow:
        return 20;
      case Speed.normal:
        return 10;
      case Speed.fast:
        return 5;
    }
  }
}
