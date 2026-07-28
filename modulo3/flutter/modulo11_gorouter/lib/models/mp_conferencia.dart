// lib/models/mp_conferencia.dart
class MpConferencia {
  final String id;
  final String titulo;
  final String categoria;
  final String ponente;
  final bool   certificado;

  const MpConferencia({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.ponente,
    required this.certificado,
  });
}

const conferenciasSimuladas = [
  MpConferencia(id: '1', titulo: 'Keynote IA',     categoria: 'Inteligencia Artificial', ponente: 'Ana Gómez',    certificado: true),
  MpConferencia(id: '2', titulo: 'Cloud Tech',     categoria: 'Cloud Computing',         ponente: 'Carlos Pérez', certificado: true),
  MpConferencia(id: '3', titulo: 'Cybersecurity',  categoria: 'Seguridad',               ponente: 'Luis Torres',  certificado: false),
];