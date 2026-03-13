import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_wheel_clean_architecture/core/providers/navbar_tabs_provider.dart';
import 'package:lucky_wheel_clean_architecture/core/routes/router.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';

@RoutePage()
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final header = ref.watch(navbarTabsHeadersProvider);
    return AutoTabsRouter(
      routes: [HomeRoute(), PresetsRoute(), SettingsRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: header,
          body: child,
          bottomNavigationBar: GNavBar(
            activeIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
              ref.read(navbarIndexProvider.notifier).setIndex(index);
            },
          ),
        );
      },
    );
  }
}
