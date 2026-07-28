// lib/models/mp_conferencia.dart
class MpConferencia {
  final String id;
  final String titulo;
  final String categoria;
  final String salon;
  final int    capacidad;
  final String ponente;
  final String contacto;
  bool         favorito;

  MpConferencia({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.salon,
    required this.capacidad,
    required this.ponente,
    required this.contacto,
    this.favorito = false,
  });
}