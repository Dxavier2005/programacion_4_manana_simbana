void main() {
  // for con índice — control de iteraciones de eventos
  for (int i = 0; i < 5; i++) {
    print('Registro de asistente $i');
  }

  // for con paso distinto — progreso de organización del evento
  for (int i = 0; i <= 100; i += 25) {
    print('Avance de planificación: $i%');
  }

  // for decreciente — cuenta regresiva para inicio del evento
  for (int i = 5; i >= 1; i--) {
    print('Inicio del evento en: $i');
  }
}