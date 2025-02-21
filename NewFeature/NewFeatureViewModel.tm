package {package}

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue

import com.tatweer.smartdrivingtest.presentation.base.BaseViewModel

class {name}ViewModel : BaseViewModel<{name}ScreenStateEvent>() {

    var state by mutableStateOf({name}ScreenState())
        private set

    fun onEvent(event: {name}ScreenEvent) {
          // TODO: Uncomment this when you add events
//        when (event) {
//
//        }
    }
}