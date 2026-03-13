import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dialog_status_provider.g.dart';

enum Status { close, show }

@riverpod
class DialogStatus extends _$DialogStatus {
  @override
  Status build() => Status.close;

  void toogleState() =>
      state = state == Status.close ? Status.show : Status.close;
}
