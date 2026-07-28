// lib/models/mp_inscripcion_dto.dart
class MpInscripcionDto {
  final int id;
  final String conferencia;
  final String asistente;
  final String motivo;
  final bool confirmado;

  const MpInscripcionDto({
    required this.id,
    required this.conferencia,
    required this.asistente,
    required this.motivo,
    required this.confirmado,
  });

  factory MpInscripcionDto.fromJson(Map<String, dynamic> json) => MpInscripcionDto(
    id:        json['id']        as int,
    conferencia: json['conferencia'] as String,
    asistente:  json['asistente']  as String,
    motivo:     json['motivo']     as String,
    confirmado: json['confirmado'] as bool,
  );
}