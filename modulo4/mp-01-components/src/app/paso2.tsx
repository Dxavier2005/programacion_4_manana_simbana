import {
  Alert,
  Image,
  Pressable,
  StyleSheet,
  Text,
  View,
} from 'react-native';

export default function Paso2() {
  return (
    <View style={styles.contenedor}>
      <Image
        source={{ uri: 'https://cdn-icons-png.flaticon.com/512/3094/3094895.png' }}
        style={styles.logo}
      />

      <Text style={styles.titulo}>Conferencias AP</Text>

      <Pressable
        style={({ pressed }) => [
          styles.boton,
          pressed && styles.botonPresionado,
        ]}
        onPress={() =>
          Alert.alert('Inscribiendo al evento', 'Inscripción registrada para el 30/07/2026')
        }
      >
        <Text style={styles.textoBoton}>Inscribirse</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 16,
  },
  logo: {
    width: 80,
    height: 80,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '600',
  },
  boton: {
    backgroundColor: '#283593',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 8,
  },
  botonPresionado: {
    backgroundColor: '#1a237e',
  },
  textoBoton: {
    color: '#fff',
    fontWeight: '600',
    fontSize: 16,
  },
});