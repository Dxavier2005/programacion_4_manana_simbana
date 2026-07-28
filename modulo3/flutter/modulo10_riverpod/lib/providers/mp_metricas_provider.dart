// lib/providers/mp_metricas_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mp_metrica_conferencia.dart';

class MpMetricasConferenciaNotifier extends AsyncNotifier<List<MpMetricaConferencia>> {
  @override
  Future<List<MpMetricaConferencia>> build() => _fetch();

  Future<List<MpMetricaConferencia>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MpMetricaConferencia(conferencia:'Keynote IA',     calificacion:4.8, asistencia:95.0, interacciones:45, estado:'Excelente'),
      MpMetricaConferencia(conferencia:'Cloud Tech',     calificacion:4.2, asistencia:80.0, interacciones:30, estado:'Bueno'),
      MpMetricaConferencia(conferencia:'Cybersecurity',  calificacion:3.9, asistencia:65.0, interacciones:15, estado:'Regular'),
      MpMetricaConferencia(conferencia:'UX/UI Design',   calificacion:4.9, asistencia:98.0, interacciones:60, estado:'Excelente'),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final mpMetricasConferenciaProvider =
    AsyncNotifierProvider<MpMetricasConferenciaNotifier, List<MpMetricaConferencia>>(
  MpMetricasConferenciaNotifier.new,
);