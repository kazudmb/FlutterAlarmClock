import UIKit
import Flutter
import AVFoundation

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let methodChannelName = "com.dmb/light_alarm"
    private let methodTest = "setTorchMode"
    
    private var flutterViewController: FlutterViewController {
        return self.window.rootViewController as! FlutterViewController
    }
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        let methodChannel = FlutterMethodChannel(name: methodChannelName, binaryMessenger: flutterViewController.binaryMessenger)
        methodChannel.setMethodCallHandler { [weak self] methodCall, result in
            if methodCall.method == self?.methodTest {
                let parameters = methodCall.arguments as? String
                let flg = (parameters == "enabled") ? true : false
                self?.ledFlash(flg: flg)
            }
        }
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func ledFlash(flg: Bool){
        let avDevice = AVCaptureDevice.default(for: AVMediaType.video)!
        if avDevice.hasTorch {
            do {
                try avDevice.lockForConfiguration() // torch device lock on
                if (flg){
                    avDevice.torchMode = AVCaptureDevice.TorchMode.on
                } else {
                    avDevice.torchMode = AVCaptureDevice.TorchMode.off
                }
                avDevice.unlockForConfiguration() // torch device unlock
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
}
