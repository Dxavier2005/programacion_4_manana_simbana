package com.shopapp.presentation.ui.admin.notifications

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.shopapp.presentation.viewmodel.NotificationViewModel

@Composable
fun NotificationScreen(
    viewModel: NotificationViewModel = hiltViewModel()
) {
    // Observamos el estado del ViewModel
    val state by viewModel.state.collectAsState()

    // Estados locales para los campos de texto
    var subject by remember { mutableStateOf("") }
    var message by remember { mutableStateOf("") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = "Enviar Notificación Masiva",
            style = MaterialTheme.typography.titleLarge
        )

        OutlinedTextField(
            value = subject,
            onValueChange = { subject = it },
            label = { Text("Asunto") },
            modifier = Modifier.fillMaxWidth()
        )

        OutlinedTextField(
            value = message,
            onValueChange = { message = it },
            label = { Text("Mensaje") },
            modifier = Modifier.fillMaxWidth(),
            minLines = 4
        )

        Button(
            onClick = {
                // userId es null para envío masivo a todos
                viewModel.sendNotification(subject, message, null)
            },
            modifier = Modifier.fillMaxWidth(),
            enabled = !state.isLoading && subject.isNotBlank() && message.isNotBlank()
        ) {
            if (state.isLoading) {
                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp),
                    color = MaterialTheme.colorScheme.onPrimary
                )
            } else {
                Text("Enviar a todos los usuarios")
            }
        }

        // Mostrar mensajes de éxito o error
        state.result?.let {
            Text("Éxito: $it", color = MaterialTheme.colorScheme.primary)
        }
        state.error?.let {
            Text("Error: $it", color = MaterialTheme.colorScheme.error)
        }
    }
}