//
//  AppDelegate+Deeplink.swift
//  DeepLink
//
//  Created by na on 15.01.2023.
//

import Foundation
import UIKit

// MARK: xcrun simctl openurl booted app://com.hrdijital.deeplink
// TODO: buradaki todo metnini terminale yapıştırarak test edilir.
extension AppDelegate {
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("url",url.description)
        if let scheme = url.scheme,
            scheme.localizedCaseInsensitiveCompare("app") == .orderedSame,
            let view = url.host {
            var parameters: [String: String] = [:]
            URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
                parameters[$0.name] = $0.value
            }

            redirect(to: view, with: parameters)
        }
        return true
    }
    public func application(_ application: UIApplication,
                            continue userActivity: NSUserActivity,
                            restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        print("userActivity",userActivity.description)
        if let url = userActivity.webpageURL {
            let view = url.lastPathComponent
            var parameters: [String: String] = [:]
            URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
                parameters[$0.name] = $0.value
            }

            redirect(to: view, with: parameters)
        }
        return true
    }
    func redirect(to:String , with parameters:[String: String]){
        print("to",to)
        print("parameters",parameters)
    }
}
