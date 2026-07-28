// lib/models/mp_conferencia.dart
class MpConferencia {
  final String id;
  final String titulo;
  final String categoria;
  final String ponente;
  final int    capacidad;
  final bool   certificado;
  bool         favorito;

  MpConferencia({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.ponente,
    required this.capacidad,
    required this.certificado,
    this.favorito = false,
  });
}