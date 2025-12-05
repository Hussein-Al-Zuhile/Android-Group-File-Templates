package {package}
import androidx.compose.runtime.Immutable


@Immutable
data class {name}ScreenState(
    override val isLoading: Boolean = false,
    override val errorMessage: UIText? = null,
):BaseUIState()
