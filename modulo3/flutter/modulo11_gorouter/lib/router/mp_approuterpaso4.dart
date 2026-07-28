// lib/router/mp_approuterpaso4.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/mp_scaffold_con_nav.dart';
import '../screens/mp_pantalla_conferencias.dart';
import '../screens/mp_pantalla_detalle.dart';
import '../screens/mp_pantalla_metricas.dart';
import '../screens/mp_pantalla_ajustes.dart';
import '../models/mp_conferencia.dart';
import '../screens/mp_pantalla_dashboard.dart';

final mpAppRouterPaso4 = GoRouter(
  initialLocation: '/conferencias',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (context, state, child) => MpScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/conferencias',
          builder: (_, __) => const MpPantallaConferencias(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) {
                final id          = state.pathParameters['id']!;
                final conferencia = state.extra as MpConferencia?;
                return MpPantallaDetalle(id: id, conferencia: conferencia);
              },
            ),
          ],
        ),
        GoRoute(
          path:    '/metricas',
          builder: (_, __) => const MpPantallaMetricas(),
        ),
        GoRoute(
          path:    '/ajustes',
          builder: (_, __) => const MpPantallaAjustes(),
        ),
        GoRoute(
          path:    '/dashboard',
          builder: (_, __) => const MpPantallaDashboard(),
        ),
      ],
    ),
  ],
);