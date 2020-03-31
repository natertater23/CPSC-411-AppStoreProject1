

import UIKit
import Contacts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  static var appDelegate: AppDelegate { return UIApplication.shared.delegate as! AppDelegate }
  
  var window: UIWindow?
  var cStore = CNContactStore()
  
  
  func requestForAccess(completionHandler: @escaping (_ accessGranted: Bool) -> Void) {
    let authorizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
    
    switch authorizationStatus {
    case .authorized:
      completionHandler(true)
      
    case .denied, .notDetermined:
      self.cStore.requestAccess(for: CNEntityType.contacts, completionHandler: { (access, accessError) -> Void in
        if access {
          completionHandler(access)
        } else {
          if authorizationStatus == CNAuthorizationStatus.denied {
            DispatchQueue.main.async {
              let msg = "\(accessError!.localizedDescription)\n\nPlease allow the app to access your contacts through the Settings."
              Helper.show(message: msg)
            }
          }
        }
      })
      
    default:
      completionHandler(false)
    }
  }
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       return true
     }}
