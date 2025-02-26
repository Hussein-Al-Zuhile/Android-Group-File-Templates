package {package}.domain.usecase.http.auth

import {package}.data.repository.MainRepository
import {package}.domain.base.BaseUseCase

class {name}UseCase(private val repository: MainRepository) : BaseUseCase<{responseType}>() {

    operator fun invoke() = execute {  }
}
