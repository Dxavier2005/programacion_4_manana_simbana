// app/index.tsx
import { StyleSheet, Text, View } from 'react-native'
import Paso2 from './paso2'
import Paso3 from './paso3'
import {TarjetaServidor} from './components/TarjetaServidor'
// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Texto y vistas básicas                               │
// │  2  Paso 2  Imágenes y botones                                   │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 3

export default function Index() {
  switch (PASO) {
    
    default:
      return (
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
          <Text>Paso {PASO}: crea la pantalla primero</Text>
        </View>
      )
  }
}

// ─── Paso 1 — lo creamos abajo ──────────────────────────────────────
function Paso1() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.encabezado}>Inventario de servidores</Text>
      <TarjetaServidor
        nombre="web-01"
        ip="10.0.2.10"
        sistema="Ubuntu 24.04 LTS"
        puerto={22}
      />
      <TarjetaServidor
        nombre="db-primary"
        ip="10.0.2.20"
        sistema="Debian 12"
        puerto={5432}
      />
      <TarjetaServidor
        nombre="cache-01"
        ip="10.0.2.30"
        sistema="Alpine 3.19"
        puerto={6379}
      />
    </View>
  )
}

const styles = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 20,
    paddingTop: 60,
    gap: 12,
  },
  centrado: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  encabezado: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
    marginBottom: 4,
  },
})