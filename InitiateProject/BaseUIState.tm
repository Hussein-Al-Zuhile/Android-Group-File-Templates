package com.tatweer.smartdrivingtest.presentation.base

import com.tatweer.smartdrivingtest.utils.UIText

abstract class BaseUIState(
    open val isLoading: Boolean = false,
    open val errorMessage: UIText? = null
)