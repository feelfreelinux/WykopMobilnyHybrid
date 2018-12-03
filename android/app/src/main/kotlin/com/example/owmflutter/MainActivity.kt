package com.example.owmflutter

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel



class MainActivity: FlutterActivity() {
    private val CHANNEL = "feelfreelinux.github.io/owmhybrid"
    var REQUEST_CODE_LOGIN = 213
    var loginScreenResult : MethodChannel.Result? = null


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openLoginScreen") {
                loginScreenResult = result;
                Log.v("dupa", "was")
                startActivityForResult(LoginScreenActivity.createIntent(this@MainActivity, call.argument<String>("appKey") ?: ""), REQUEST_CODE_LOGIN)
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_CODE_LOGIN && resultCode == Activity.RESULT_OK) {

            loginScreenResult?.success(
                    hashMapOf(
                            Pair("login", data?.getStringExtra(LoginScreenActivity.EXTRA_LOGIN) ?: ""),
                            Pair("token", data?.getStringExtra(LoginScreenActivity.EXTRA_TOKEN) ?: ""))
            )
        }
    }
}
