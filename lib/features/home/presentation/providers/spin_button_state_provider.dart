import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spin_button_state_provider.g.dart';

@riverpod
class IsSpinning extends _$IsSpinning {
  @override
  bool build() => false;

  void toogleState() => state = !state;
}
