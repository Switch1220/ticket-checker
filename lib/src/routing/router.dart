import 'package:go_router/go_router.dart';
import 'package:ticket_checker/src/presentation/scan/scan_page.dart';
import 'package:ticket_checker/src/presentation/setting/setting_page.dart';

final router = GoRouter(
  initialLocation: ScanPage.routeName,
  routes: [
    GoRoute(
      path: ScanPage.routeName,
      builder: (context, state) => const ScanPage(),
    ),
    GoRoute(
      path: SettingPage.routeName,
      builder: (context, state) => const SettingPage(),
      routes: [
        GoRoute(
          path: AdvancedTab.routeName,
          builder: (context, state) => const AdvancedTab(),
        ),
      ],
    ),
  ],
);
