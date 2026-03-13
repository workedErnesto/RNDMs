import 'package:auto_route/auto_route.dart';
import 'package:lucky_wheel_clean_architecture/features/about/presentation/screens/about_app_screen.dart';
import 'package:lucky_wheel_clean_architecture/features/history/presentation/screens/history_screen.dart';
import 'package:lucky_wheel_clean_architecture/features/main/main_screen.dart';
import 'package:lucky_wheel_clean_architecture/features/home/presentation/screens/screens.dart';
import 'package:lucky_wheel_clean_architecture/features/settings/presentation/screens/settings_screen.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/presentation/screens/screens.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: Duration(milliseconds: 150),
      page: MainRoute.page,
      path: '/',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: PresetsRoute.page, path: 'presets'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ],
    ),
    CustomRoute(
      page: PresetEditorRoute.page,
      path: '/editor',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: Duration(milliseconds: 150),
      reverseDuration: Duration(milliseconds: 150),
      opaque: true,
    ),
    CustomRoute(
      page: ListPresetsRoute.page,
      path: '/list',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: Duration(milliseconds: 150),
    ),
    CustomRoute(
      page: HistoryRoute.page,
      path: '/history',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: Duration(milliseconds: 150),
    ),
    CustomRoute(
      page: AboutAppRoute.page,
      path: '/about_app',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: Duration(milliseconds: 150),
    ),
  ];
}
