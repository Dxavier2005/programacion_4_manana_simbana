// app/index.tsx
import React, { ReactNode, useState } from 'react'
import { Modal, Pressable, SafeAreaView, ScrollView, StyleSheet, Text, View } from 'react-native'

const PASO = 6

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    case 2:
      return <Paso2 />
    case 3:
      return <Paso3 />
    case 4:
      return <Paso4 />
    case 5:
      return <Paso5 />
    case 6:
      return <Paso6 />
    default:
      return (
        <View style={styles.centrado}>
          <Text>Paso {PASO}: crea el componente primero</Text>
        </View>
      )
  }
}

// ─── Paso 1 — Props tipadas ──────────────────────────────────────────

interface TarjetaAsistenteProps {
  nombre: string
  categoria: string
  tema: string
  horas: number
  asistente?: string
}

function TarjetaAsistente({ nombre, categoria, tema, horas, asistente }: TarjetaAsistenteProps) {
  return (
    <View style={styles.tarjeta}>
      <Text style={styles.nombreMascota}>{nombre}</Text>
      <Text style={styles.datoEspecie}>{categoria} · {tema}</Text>
      <Text style={styles.datoEdad}>{horas} horas</Text>
      {asistente && <Text style={styles.datoDueno}>Asistente: {asistente}</Text>}
    </View>
  )
}

function Paso1() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.encabezado}>Conferencias de tecnología</Text>
      <TarjetaAsistente
        nombre="Flutter Avanzado"
        categoria="Desarrollo móvil"
        tema="Arquitectura y Clean Code"
        horas={3}
        asistente="María García"
      />
      <TarjetaAsistente
        nombre="Inteligencia Artificial"
        categoria="IA & Machine Learning"
        tema="Modelos de lenguaje"
        horas={5}
        asistente="Carlos López"
      />
      <TarjetaAsistente
        nombre="Cloud Computing"
        categoria="Infraestructura"
        tema="AWS y Serverless"
        horas={2}
        asistente="Ana Martínez"
      />
    </View>
  )
}

// ─── Paso 2 — children y composición ────────────────────────────────

interface CardProps {
  titulo: string
  subtitulo?: string
  children: ReactNode
}

function Card({ titulo, subtitulo, children }: CardProps) {
  return (
    <View style={estilos2.card}>
      <View style={estilos2.cardCabecera}>
        <Text style={estilos2.cardTitulo}>{titulo}</Text>
        {subtitulo && (
          <Text style={estilos2.cardSubtitulo}>{subtitulo}</Text>
        )}
      </View>
      <View style={estilos2.cardCuerpo}>{children}</View>
    </View>
  )
}

function FilaInfo({ etiqueta, valor }: { etiqueta: string; valor: string }) {
  return (
    <View style={estilos2.fila}>
      <Text style={estilos2.etiqueta}>{etiqueta}</Text>
      <Text style={estilos2.valor}>{valor}</Text>
    </View>
  )
}

function Paso2() {
  return (
    <View style={estilos2.fondo}>
      <Text style={estilos2.titulo}>Ficha de conferencia</Text>

      <Card titulo="Flutter Avanzado" subtitulo="Desarrollo móvil · 3 horas">
        <FilaInfo etiqueta="Ponente" valor="María García" />
        <FilaInfo etiqueta="Cupo" valor="45 personas" />
        <FilaInfo etiqueta="Sala" valor="Auditorio A" />
        <FilaInfo etiqueta="Certificado" valor="Incluido" />
        <FilaInfo etiqueta="Fecha" valor="15/07/2026" />
      </Card>

      <Card titulo="Inteligencia Artificial" subtitulo="IA & Machine Learning · 5 horas">
        <FilaInfo etiqueta="Ponente" valor="Carlos López" />
        <FilaInfo etiqueta="Cupo" valor="30 personas" />
        <FilaInfo etiqueta="Sala" valor="Auditorio B" />
        <FilaInfo etiqueta="Certificado" valor="Pendiente acreditación" />
        <FilaInfo etiqueta="Fecha" valor="10/06/2026" />
      </Card>
    </View>
  )
}



type EstadoConferencia = 'confirmada' | 'observacion' | 'critico' | 'alta'

interface BadgeSaludProps {
  estado: EstadoConferencia
  tamaño?: number           // opcional — valor por defecto: 12
  mostrarIcono?: boolean   // opcional — valor por defecto: false
}

const COLOR_SALUD: Record<EstadoConferencia, { fondo: string; texto: string }> = {
  confirmada:  { fondo: '#e8eaf6', texto: '#283593' },
  observacion: { fondo: '#fff8e1', texto: '#f57f17' },
  critico:     { fondo: '#fce4ec', texto: '#c62828' },
  alta:        { fondo: '#f5f5f5', texto: '#616161' },
}

const ICONO_SALUD: Record<EstadoConferencia, string> = {
  confirmada:  '✓',
  observacion: '◐',
  critico:     '✕',
  alta:        '○',
}

function BadgeSalud({
  estado,
  tamaño = 12,
  mostrarIcono = false,
}: BadgeSaludProps) {
  const colores = COLOR_SALUD[estado]
  return (
    <View style={[estilos3.badge, { backgroundColor: colores.fondo }]}>
      {mostrarIcono && (
        <Text style={[estilos3.icono, { color: colores.texto, fontSize: tamaño }]}>
          {ICONO_SALUD[estado]}{' '}
        </Text>
      )}
      <Text style={[estilos3.textoBadge, { color: colores.texto, fontSize: tamaño }]}>
        {estado.toUpperCase()}
      </Text>
    </View>
  )
}

interface FilaConferenciaProps {
  nombre: string
  categoria: string
  estado: EstadoConferencia
  cupo?: number        // personas — opcional
}

function FilaConferencia({ nombre, categoria, estado, cupo }: FilaConferenciaProps) {
  return (
    <View style={estilos3.fila}>
      <View style={estilos3.infoIzq}>
        <Text style={estilos3.nombreMascota}>{nombre}</Text>
        <Text style={estilos3.especieTexto}>{categoria}</Text>
      </View>
      <View style={estilos3.infoDer}>
        {cupo !== undefined && (
          <Text style={estilos3.peso}>{cupo} pers.</Text>
        )}
        <BadgeSalud estado={estado} mostrarIcono tamaño={11} />
      </View>
    </View>
  )
}
function Paso3() {
  return (
    <View style={estilos3.fondo}>
      <Text style={estilos3.titulo}>Estado de conferencias</Text>
      <FilaConferencia nombre="Flutter Avanzado"    categoria="Desarrollo móvil"   estado="confirmada"   cupo={45} />
      <FilaConferencia nombre="Inteligencia Art." categoria="IA & ML"            estado="confirmada"   cupo={30} />
      <FilaConferencia nombre="Cloud Computing"    categoria="Infraestructura"    estado="observacion"  cupo={20} />
      <FilaConferencia nombre="Cybersecurity"      categoria="Seguridad"         estado="critico"               />
      <FilaConferencia nombre="UI/UX Design"       categoria="Diseño"            estado="alta"                  />
    </View>
  )
}

const CONFERENCIAS_DEMO = [
  { id: '1',  nombre: 'Flutter Avanzado',    categoria: 'Desarrollo móvil',   tema: 'Clean Code',       horas: 3,  cupo: 45, asis: 38, satisfaccion: 90 },
  { id: '2',  nombre: 'Inteligencia Art.',   categoria: 'IA & ML',            tema: 'LLMs',             horas: 5,  cupo: 30, asis: 28, satisfaccion: 60 },
  { id: '3',  nombre: 'Cloud Computing',     categoria: 'Infraestructura',    tema: 'AWS',              horas: 2,  cupo: 20, asis: 19, satisfaccion: 75 },
  { id: '4',  nombre: 'Cybersecurity',       categoria: 'Seguridad',          tema: 'Pentesting',       horas: 4,  cupo: 50, asis: 48, satisfaccion: 40 },
  { id: '5',  nombre: 'UI/UX Design',        categoria: 'Diseño',             tema: 'Figma',            horas: 1,  cupo: 15, asis: 15, satisfaccion: 85 },
  { id: '6',  nombre: 'DevOps Essentials',   categoria: 'Operaciones',        tema: 'Docker & K8s',     horas: 4,  cupo: 40, asis: 35, satisfaccion: 95 },
  { id: '7',  nombre: 'Big Data',            categoria: 'Datos',              tema: 'Spark',            horas: 6,  cupo: 25, asis: 20, satisfaccion: 30 },
  { id: '8',  nombre: 'Blockchain',          categoria: 'Fintech',            tema: 'Smart Contracts',  horas: 3,  cupo: 35, asis: 30, satisfaccion: 70 },
  { id: '9',  nombre: 'React Native',        categoria: 'Desarrollo móvil',   tema: 'Cross-platform',   horas: 3,  cupo: 50, asis: 45, satisfaccion: 50 },
  { id: '10', nombre: 'Videojuegos Unity',   categoria: 'Gaming',             tema: 'C# scripting',     horas: 2,  cupo: 10, asis: 10, satisfaccion: 80 },
  { id: '11', nombre: 'Arquitectura Soft',   categoria: 'Ingeniería',         tema: 'Microservicios',   horas: 4,  cupo: 60, asis: 55, satisfaccion: 65 },
  { id: '12', nombre: 'Product Management',  categoria: 'Negocios',           tema: 'Agile & Scrum',    horas: 1,  cupo: 20, asis: 20, satisfaccion: 100 },
]

interface BarraSatisfaccionProps {
  porcentaje: number
  etiqueta: string
}

function BarraSatisfaccion({ porcentaje, etiqueta }: BarraSatisfaccionProps) {
  const color = porcentaje > 85 ? '#283593'
              : porcentaje > 60 ? '#f57f17'
              : '#c62828'
  return (
    <View style={estilos4.barraFila}>
      <Text style={estilos4.barraEtiqueta}>{etiqueta}</Text>
      <View style={estilos4.barraFondo}>
        <View style={[estilos4.barraRelleno, { width: `${porcentaje}%` as any, backgroundColor: color }]} />
      </View>
      <Text style={[estilos4.barraPct, { color }]}>{porcentaje}%</Text>
    </View>
  )
}

function TarjetaConferenciaCompleta({ nombre, categoria, tema, horas, cupo, asis, satisfaccion }: typeof CONFERENCIAS_DEMO[0]) {
  return (
    <View style={estilos4.nodo}>
      <View style={estilos4.nodoEncabezado}>
        <Text style={estilos4.nodoNombre}>{nombre}</Text>
        <Text style={estilos4.nodoEspecie}>{categoria}</Text>
      </View>
      <Text style={estilos4.nodoRaza}>{tema} · {horas} horas</Text>
      <BarraSatisfaccion porcentaje={Math.round((asis / cupo) * 100)} etiqueta="Cupo" />
      <BarraSatisfaccion porcentaje={satisfaccion} etiqueta="Satisf." />
    </View>
  )
}

function Paso4() {
  return (
    <SafeAreaView style={estilos4.safeArea}>
      <View style={estilos4.header}>
        <Text style={estilos4.headerTitulo}>Conferencias programadas</Text>
        <Text style={estilos4.headerSub}>{CONFERENCIAS_DEMO.length} eventos registrados</Text>
      </View>
      <ScrollView
        style={estilos4.scroll}
        contentContainerStyle={estilos4.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        {CONFERENCIAS_DEMO.map((conferencia) => (
          <TarjetaConferenciaCompleta key={conferencia.id} {...conferencia} />
        ))}
      </ScrollView>
    </SafeAreaView>
  )
}

interface ModalConfirmProps {
  visible: boolean
  titulo: string
  mensaje: string
  etiquetaConfirmar?: string
  etiquetaCancelar?: string
  onConfirmar: () => void
  onCancelar: () => void
}

function ModalConfirm({
  visible,
  titulo,
  mensaje,
  etiquetaConfirmar = 'Confirmar',
  etiquetaCancelar = 'Cancelar',
  onConfirmar,
  onCancelar,
}: ModalConfirmProps) {
  return (
    <Modal
      visible={visible}
      transparent
      animationType="fade"
      onRequestClose={onCancelar}
    >
      <Pressable style={estilos5.fondo} onPress={onCancelar}>
        <Pressable style={estilos5.dialogo} onPress={() => {}}>
          <Text style={estilos5.dialogoTitulo}>{titulo}</Text>
          <Text style={estilos5.dialogoMensaje}>{mensaje}</Text>
          <View style={estilos5.botones}>
            <Pressable
              style={[estilos5.boton, estilos5.botonCancelar]}
              onPress={onCancelar}
            >
              <Text style={estilos5.textoCancelar}>{etiquetaCancelar}</Text>
            </Pressable>
            <Pressable
              style={[estilos5.boton, estilos5.botonConfirmar]}
              onPress={onConfirmar}
            >
              <Text style={estilos5.textoConfirmar}>{etiquetaConfirmar}</Text>
            </Pressable>
          </View>
        </Pressable>
      </Pressable>
    </Modal>
  )
}

function Paso5() {
  const [modalVisible, setModalVisible] = useState(false)
  const [accionEjecutada, setAccionEjecutada] = useState<string | null>(null)

  return (
    <SafeAreaView style={estilos5.safeArea}>
      <Text style={estilos5.titulo}>Gestión de conferencias</Text>
      <Text style={estilos5.subtitulo}>Flutter Avanzado · Desarrollo móvil</Text>

      <View style={estilos5.acciones}>
        <Pressable
          style={estilos5.botonAccion}
          onPress={() => {
            setAccionEjecutada(null)
            setModalVisible(true)
          }}
        >
          <Text style={estilos5.textoAccion}>Confirmar asistencia</Text>
        </Pressable>
      </View>

      {accionEjecutada && (
        <View style={estilos5.resultado}>
          <Text style={estilos5.textoResultado}>{accionEjecutada}</Text>
        </View>
      )}

      <ModalConfirm
        visible={modalVisible}
        titulo="Confirmar asistencia"
        mensaje={`¿Confirmas tu asistencia a la conferencia de Flutter Avanzado?\nVerifica tu correo antes de proceder.`}
        etiquetaConfirmar="Confirmar"
        onConfirmar={() => {
          setModalVisible(false)
          setAccionEjecutada('Asistencia confirmada para Flutter Avanzado a las ' + new Date().toLocaleTimeString())
        }}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  )
}

interface AccionProps {
  etiqueta: string
  color: string
  onPress: () => void
}

function BotonAccion({ etiqueta, color, onPress }: AccionProps) {
  return (
    <Pressable
      style={({ pressed }) => [
        estilos6.botonAccion,
        { backgroundColor: color },
        pressed && { opacity: 0.75 },
      ]}
      onPress={onPress}
    >
      <Text style={estilos6.textoBotonAccion}>{etiqueta}</Text>
    </Pressable>
  )
}

function Paso6() {
  const [modalVisible, setModalVisible] = useState(false)
  const [accionPendiente, setAccionPendiente] = useState<string>('')
  const [log, setLog] = useState<string[]>([])

  function pedirConfirmacion(accion: string) {
    setAccionPendiente(accion)
    setModalVisible(true)
  }

  function ejecutarAccion() {
    const entrada = `[${new Date().toLocaleTimeString()}] ${accionPendiente} realizado en Flutter Avanzado`
    setLog((prev) => [entrada, ...prev])
    setModalVisible(false)
  }

  return (
    <SafeAreaView style={estilos6.safeArea}>
      {/* Cabecera fija — fuera del scroll */}
      <View style={estilos6.cabecera}>
        <View>
          <Text style={estilos6.cabNombre}>Flutter Avanzado</Text>
          <Text style={estilos6.cabEspecie}>Desarrollo móvil · 3 horas</Text>
        </View>
        <BadgeSalud estado="confirmada" mostrarIcono tamaño={12} />
      </View>

      {/* Contenido desplazable */}
      <ScrollView
        contentContainerStyle={estilos6.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        {/* Card de métricas de evento */}
        <Card titulo="Métricas del evento" subtitulo="Última actualización: hoy 15:30">
          <FilaInfo etiqueta="Cupo máximo" valor="45 personas" />
          <FilaInfo etiqueta="Asistentes inscritos" valor="38 personas" />
          <FilaInfo etiqueta="Satisfacción promedio" valor="90%" />
          <FilaInfo etiqueta="Duración" valor="3 horas" />
          <FilaInfo etiqueta="Última edición" valor="15/04/2026" />
        </Card>

        {/* Card de información de la conferencia */}
        <Card titulo="Información de la conferencia">
          <FilaInfo etiqueta="Categoría" valor="Desarrollo móvil" />
          <FilaInfo etiqueta="Tema principal" valor="Clean Code & Arquitectura" />
          <FilaInfo etiqueta="Nivel" valor="Avanzado" />
          <FilaInfo etiqueta="Modalidad" valor="Híbrido" />
          <FilaInfo etiqueta="Ponente" valor="María García" />
          <FilaInfo etiqueta="Contacto" valor="contacto@events.dev" />
        </Card>

        {/* Card de acciones de gestión */}
        <Card titulo="Acciones de gestión">
          <View style={estilos6.gridAcciones}>
            <BotonAccion
              etiqueta="Inscribirse"
              color="#283593"