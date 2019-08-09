import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: "feelfreelinux.github.io/owmhybrid", binaryMessenger: controller.binaryMessenger)
        methodChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if (call.method == "openLoginScreen") {
                // Initializate login screen
                let loginScreenController = controller.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                loginScreenController.appKey = (call.arguments as! NSDictionary)["appKey"] as! String
                loginScreenController.loggedInCallback = {
                    let resu : NSDictionary = ["token": loginScreenController.token!, "login": loginScreenController.login!]
                    result(resu)
                }
                controller.present(loginScreenController, animated: true, completion: nil)
            }
        })
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
