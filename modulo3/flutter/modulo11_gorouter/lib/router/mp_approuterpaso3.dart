// lib/router/mp_approuterpaso3.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/mp_pantalla_inicio.dart';
import '../screens/mp_pantalla_conferencias_filtro.dart';
import '../screens/mp_pantalla_detalle.dart';
import '../models/mp_conferencia.dart';

final mpAppRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const MpPantallaInicio(),
    ),
    GoRoute(
      path:    '/conferencias',
      builder: (context, state) {
        final soloCertificados = state.uri.queryParameters['soloCertificados'] == 'true';
        return MpPantallaConferenciasFiltro(soloCertificados: soloCertificados);
      },
    ),
    GoRoute(
      path:    '/conferencias/:id',
      builder: (context, state) {
        final id          = state.pathParameters['id']!;
        final conferencia = state.extra as MpConferencia?;
        return MpPantallaDetalle(id: id, conferencia: conferencia);
      },
    ),
  ],
);