package {package}

import {package}.presentation.base.BaseUIState
import {package}.utils.UIText

data class {name}ScreenState(
    override val isLoading: Boolean = false,
    override val errorMessage: UIText? = null,
):BaseUIState()