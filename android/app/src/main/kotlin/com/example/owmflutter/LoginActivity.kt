package com.example.owmflutter

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.support.annotation.RequiresApi
import android.util.Log
import android.webkit.CookieManager
import android.webkit.CookieSyncManager
import android.webkit.WebResourceRequest
import android.webkit.WebView
import android.webkit.WebViewClient

typealias TokenUrlCallback = (url: String) -> Unit

class LoginActivityWebClient(private val tokenUrlCallback: TokenUrlCallback) : WebViewClient() {
    @Suppress("OverridingDeprecatedMember")
    override fun shouldOverrideUrlLoading(view: WebView?, url: String?): Boolean {
        url?.let { tokenUrlCallback.invoke(it) }
        return super.shouldOverrideUrlLoading(view, url)
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun shouldOverrideUrlLoading(view: WebView?, request: WebResourceRequest?): Boolean {
        request?.let {
            tokenUrlCallback.invoke(it.url.toString())
        }
        return super.shouldOverrideUrlLoading(view, request)
    }

    override fun onPageFinished(view: WebView, url: String?) {
        val cookieManager = CookieManager.getInstance()
        CookieSyncManager.getInstance().sync()
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
            cookieManager.flush()
        } else {
        }
    }
}

@Suppress("DEPRECATION")
class LoginScreenActivity : Activity() {

    companion object {
        const val CONNECT_URL: String = "https://a2.wykop.pl/login/connect/appkey/"
        const val EXTRA_TOKEN = "TOKEN"
        const val EXTRA_LOGIN = "LOGIN"
        const val EXTRA_APPKEY = "APPKEY"

        fun createIntent(context: Context, appKey: String): Intent {
            val intent = Intent(context, LoginScreenActivity::class.java)
            intent.putExtra(EXTRA_APPKEY, appKey)
            return intent
        }
    }

    val webView by lazy { WebView(this) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(webView)
        setupWebView()
    }

    val appKey by lazy { intent.getStringExtra(EXTRA_APPKEY) }

    @SuppressLint("SetJavaScriptEnabled")
    private fun setupWebView() {
        webView.apply {
            CookieSyncManager.createInstance(this@LoginScreenActivity)
            CookieSyncManager.getInstance().startSync()
            val cookieManager = CookieManager.getInstance()

            if (Build.VERSION.SDK_INT >= 21) {
                // AppRTC requires third party cookies to work
                cookieManager.setAcceptCookie(true)
                cookieManager.setAcceptThirdPartyCookies(webView, true)
            } else {
                cookieManager.setAcceptCookie(true)
            }
            settings.javaScriptEnabled = true

            webViewClient = LoginActivityWebClient {
                extractToken(it)

            }
            loadUrl(CONNECT_URL + appKey)
        }
    }

    fun extractToken(url: String) {
        if (url.contains("ConnectSuccess")) {
            url.apply {
                if (!contains("/token/") and !contains("/login/")) {
                    return
                }
            }
            Log.v("WTF", url)

            val login = url
                    .split("/token/").first()
                    .substringAfterLast("/login/")
            val token = url
                    .split("/token/").last()
                    .replace("/", "")

            if (login.isNotEmpty() && token.isNotEmpty()) {
                val resultIntent = Intent()
                resultIntent.putExtra(EXTRA_TOKEN, token)
                resultIntent.putExtra(EXTRA_LOGIN, login)

                setResult(Activity.RESULT_OK, resultIntent)
                finish()
            }
        }
    }
}