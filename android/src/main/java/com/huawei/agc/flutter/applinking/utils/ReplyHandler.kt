package com.huawei.agc.flutter.applinking.utils

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock

class ReplyHandler(val call: MethodCall, private val result: MethodChannel.Result?) {

    companion object {
        val handler = Handler(Looper.getMainLooper())
    }

    private var isReply = false

    private val lock = ReentrantLock()

    fun success(any: Any?) {
        run {
            result?.success(any)
        }
    }

    fun error(code: String, detail: String? = null, error: Any? = null) {
        run {
            result?.error(code, detail, error)
        }
    }

    fun notImplemented() {
        run {
            result?.notImplemented()
        }
    }

    private inline fun run(crossinline runnable: () -> Unit) {
        lock.withLock {
            if (isReply) {
                return
            }
            isReply = true
            handler.post {
                runnable()
            }
        }
    }
}