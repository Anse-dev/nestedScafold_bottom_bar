import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test_d/scaffold_nested_navigation.dart';
import 'package:test_d/screens/compteur.dart';
import 'package:test_d/screens/compteur_2.dart';
import 'package:test_d/screens/details_screen.dart';
import 'package:test_d/screens/first_screen.dart';
import 'package:test_d/screens/home_screen.dart';
import 'package:test_d/screens/message_screen.dart';
import 'package:test_d/screens/publier_screen.dart';
import 'package:test_d/screens/secondary.dart';
import 'package:test_d/screens/trajet_screen.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'rechercher');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'publier');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'vosTrajets');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'messages');
final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'profil');

// the one and only GoRouter instance
GoRouter? _previousRouter;
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "/",
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) async {
      return null;
    },
    //refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      // splash

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          // first branch (A)

          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/',
                name: 'home',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
                routes: [
                  GoRoute(
                    path: 'first',
                    name: 'first',
                    builder: (context, state) => const FirstScreen(),
                  ),
                ],
              ),
            ],
          ),
          // second branch (B)
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/publier',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: PublierPage(),
                ),
                routes: [
                  // child route
                  GoRoute(
                    path: 'second',
                    name: 'second',
                    builder: (context, state) => const SecondScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/vos-trajets',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: CompteurScreen(),
                ),
                routes: [
                  // child route
                  GoRoute(
                    path: 'detail',
                    builder: (context, state) =>
                        const DetailsScreen(label: 'B'),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/messages',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: MessagesPage(label: 'vos trajets'),
                ),
                routes: [
                  // child route
                  GoRoute(
                    path: 'advance',
                    name: 'advance',
                    builder: (context, state) => const AdvancedCounterScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

Widget _fadeTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(opacity: animation, child: child);
}

Widget _slideTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  const curve = Curves.easeInOut;
  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var offsetAnimation = animation.drive(tween);
  return SlideTransition(position: offsetAnimation, child: child);
}
