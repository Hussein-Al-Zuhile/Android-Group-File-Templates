package {package}


data class {name}ScreenState(
    override val isLoading: Boolean = false,
    override val errorMessage: UIText? = null,
):BaseUIState()