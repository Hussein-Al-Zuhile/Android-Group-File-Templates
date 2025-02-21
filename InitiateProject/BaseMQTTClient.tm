package {package}

import com.hivemq.client.mqtt.MqttGlobalPublishFilter
import com.hivemq.client.mqtt.datatypes.MqttQos
import com.hivemq.client.mqtt.mqtt3.Mqtt3AsyncClient
import com.hivemq.client.mqtt.mqtt3.message.connect.Mqtt3Connect
import com.hivemq.client.mqtt.mqtt3.message.connect.connack.Mqtt3ConnAck
import com.hivemq.client.mqtt.mqtt3.message.publish.Mqtt3Publish
import com.hivemq.client.mqtt.mqtt3.message.subscribe.suback.Mqtt3SubAck
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.cancel
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.util.concurrent.CompletableFuture


abstract class BaseMQTTClient() {

    protected abstract val client: Mqtt3AsyncClient

    private var coroutineScope = CoroutineScope(Dispatchers.IO)

    //region APIs
    suspend fun connect(renewSession: Boolean = false): Mqtt3ConnAck? {
        if (client.state.isConnectedOrReconnect) return null
        return withContext(Dispatchers.IO) {

            val mqtt3ConnAck = client.connect(
                Mqtt3Connect.builder()
                    .cleanSession(renewSession)
                    .build()
            ).join()

            if (!mqtt3ConnAck.returnCode.isError) {
                if (!coroutineScope.isActive) {
                    coroutineScope = CoroutineScope(Dispatchers.IO)
                }
                client.publishes(MqttGlobalPublishFilter.SUBSCRIBED) {
                    if (BuildConfig.DEBUG) {
                        println("Received message: ${it.topic} - ${String(it.payloadAsBytes)}")
                    }
                    coroutineScope.launch {
                        _messagesSharedFlow.emit(it)
                    }
                }
            }

            mqtt3ConnAck
        }

    }

    fun disconnect(): CompletableFuture<Void> {
        coroutineScope.cancel()
        return client.disconnect()
    }

    private val _messagesSharedFlow: MutableSharedFlow<Mqtt3Publish> =
        MutableSharedFlow<Mqtt3Publish>()
    val messagesSharedFlow: SharedFlow<Mqtt3Publish> = _messagesSharedFlow.asSharedFlow()


    //endregion

    //region Helpers
    protected fun unsubscribeWithDefaults(topic: String) = client.unsubscribeWith()
        .topicFilter(topic)
        .send()

    protected fun subscribeWithDefaults(
        topic: String,
        qos: MqttQos = MqttQos.AT_LEAST_ONCE
    ): CompletableFuture<Mqtt3SubAck> =
        client.subscribeWith()
            .topicFilter(topic)
            .qos(qos)
            .send()

    protected fun publishWithDefaults(
        topic: String,
        payload: ByteArray,
        qos: MqttQos = MqttQos.AT_LEAST_ONCE,
        retain: Boolean = false
    ): CompletableFuture<Mqtt3Publish> = client.publishWith()
        .topic(topic)
        .qos(qos)
        .payload(payload)
        .retain(retain)
        .send()
    //endregion

}
