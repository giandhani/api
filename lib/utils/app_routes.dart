import 'package:api/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = "home";

  static Page _homePageBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomePage(),
    );
  }

  static GoRouter goRouter = GoRouter(initialLocation: "/home", routes: [
    GoRoute(name: home, path: "/home", pageBuilder: _homePageBuilder)
  ]);
}
