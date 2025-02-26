package {package}

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import {package}.presentation.theme.AppTheme

@Composable
fun {name}Screen(
    modifier: Modifier = Modifier
) {

}

@Preview
@Composable
private fun Preview{name}Screen() {
    AppTheme {
        {name}Screen()
    }
}