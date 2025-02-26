package {package}.di

import {package}.data.datasource.remote.http.ExampleHttpClient
import {package}.data.datasource.remote.mqtt.ExampleMQTTClient
import {package}.data.repository.MainRepository
import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.singleOf
import org.koin.core.module.dsl.viewModelOf
import org.koin.dsl.module

val MainModule = module {
    single { ExampleHttpClient }
    singleOf(::MainRepository)
    singleOf(::ExampleMQTTClient)
}