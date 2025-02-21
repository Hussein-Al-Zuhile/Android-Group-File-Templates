package com.tatweer.smartdrivingtest.domain.usecase.http.auth

import com.tatweer.smartdrivingtest.data.repository.MainRepository
import com.tatweer.smartdrivingtest.domain.base.BaseUseCase

class {name}UseCase(private val repository: MainRepository) : BaseUseCase<{responseType}>() {

    operator fun invoke() = execute {  }
}
