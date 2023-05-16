import 'package:flutter/material.dart';
import 'package:flutter_go_router_bug/details.dart';
import 'package:flutter_go_router_bug/home.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> getRoutes() {
  return [
    GoRoute(
        name: 'root',
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            name: 'details',
            path: 'details',

            // It works
            // builder: (BuildContext context, state) {
            //   return const DetailsPage();
            // },

            // Doesn't work
            pageBuilder: (context, state) {
              return CustomTransitionPage<void>(
                transitionDuration: const Duration(milliseconds: 600),
                reverseTransitionDuration: const Duration(seconds: 300),
                key: state.pageKey,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0.0);
                  var end = Offset.zero;

                  late final Animation<Offset> offsetAnimation = Tween<Offset>(
                    begin: begin,
                    end: end,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutExpo,
                  ));

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                child: const DetailsPage(),
              );
            },
          )
        ]),

    //
  ];
}
