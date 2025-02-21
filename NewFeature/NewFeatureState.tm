package {package}

import com.tatweer.smartdrivingtest.presentation.base.BaseUIState
import com.tatweer.smartdrivingtest.utils.UIText

data class {name}ScreenState(
    override val isLoading: Boolean = false,
    override val errorMessage: UIText? = null,
):BaseUIState()