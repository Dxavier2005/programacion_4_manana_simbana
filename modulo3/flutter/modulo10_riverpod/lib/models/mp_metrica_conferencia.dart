// lib/models/mp_metrica_conferencia.dart
class MpMetricaConferencia {
  final String conferencia;
  final double calificacion;
  final double asistencia;
  final int    interacciones; // preguntas o votos por minuto
  final String estado;

  const MpMetricaConferencia({
    required this.conferencia,
    required this.calificacion,
    required this.asistencia,
    required this.interacciones,
    required this.estado,
  });
}