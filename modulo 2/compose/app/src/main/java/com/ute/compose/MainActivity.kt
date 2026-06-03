// MainActivity.kt
package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.ute.compose.ui.material3.*
import com.ute.compose.ui.screens.*

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                //Componentes basicos nativos:
                //S01_SaludoScreen()
                //S03_ButtonScreen()
                //S04_LayoutScreen()
                //S05_ModifierScreen()
                //S06_EstadoScreen()
                //S07_StateHoistingScreen()
                //S08_BienvenidaScreen()
                // Componentes Material 3:
                //Paso01_TextFieldScreen()
                //Paso01SumaScreen()
                //CompraTiendaScreen()
                //Paso02_CardScreen()
                //Paso03LazyColumnScreen()
                //Paso04_ScaffoldScreen()
                //Paso05_NavBarScreen()
                Paso06_DialogosScreen()
            }
        }
    }
}