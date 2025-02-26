package {package}.presentation.base

import {package}.utils.UIText

abstract class BaseUIState(
    open val isLoading: Boolean = false,
    open val errorMessage: UIText? = null
)