package com.example.owmflutter

import com.transistorsoft.flutter.backgroundfetch.BackgroundFetchPlugin;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

class Application : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate();
        BackgroundFetchPlugin.setPluginRegistrant(this);
    }

    override fun registerWith(registry: PluginRegistry) {
        GeneratedPluginRegistrant.registerWith(registry);
    }
}