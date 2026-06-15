package com.shopapp.presentation.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.shopapp.domain.repository.UserRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

data class NotificationUiState(
    val isLoading: Boolean = false,
    val result: String? = null,
    val error: String? = null,
)

@HiltViewModel
class NotificationViewModel @Inject constructor(
    private val repository: UserRepository,
) : ViewModel() {

    private val _state = MutableStateFlow(NotificationUiState())
    val state: StateFlow<NotificationUiState> = _state.asStateFlow()

    fun sendNotification(subject: String, message: String, userId: Int?) {
        viewModelScope.launch {
            _state.update { it.copy(isLoading = true, error = null, result = null) }
            repository.sendNotification(subject, message, userId)
                .onSuccess { res ->
                    _state.update { it.copy(isLoading = false, result = res.detail) }
                }
                .onFailure { e ->
                    _state.update { it.copy(isLoading = false, error = e.message) }
                }
        }
    }
}