import 'package:flutter/material.dart';
import 'package:flutter_go_router_bug/routes.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  debugLogDiagnostics: true,
  routes: getRoutes(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
