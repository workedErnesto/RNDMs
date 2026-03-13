import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navbar_tabs_provider.g.dart';

@riverpod
class NavbarIndex extends _$NavbarIndex {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

@riverpod
class NavbarTabsHeaders extends _$NavbarTabsHeaders {
  @override
  Header build() {
    final index = ref.watch(navbarIndexProvider);
    switch (index) {
      case 0:
        return Header(label: 'главная');
      case 1:
        return Header(label: 'пресеты');
      case 2:
        return Header(label: 'настройки');
      default:
        return Header(label: 'ошибка');
    }
  }
}
