

import Foundation
import UIKit

class Helper {
    static func show(message: String) {
        let alertController = UIAlertController(title: "Birthdays", message: message, preferredStyle: .alert)
    let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alertController.addAction(dismissAction)
    
    let pushedViewControllers = (UIApplication.shared.keyWindow?.rootViewController as! UINavigationController).viewControllers
    let presentedViewController = pushedViewControllers.last
    
    presentedViewController?.present(alertController, animated: true, completion: nil)
  }
}

extension DateComponents {
  var asString: String? {
    if let date = Calendar.current.date(from: self) {
      let dateFormat = DateFormatter()
      dateFormat.locale = Locale.current
      dateFormat.dateStyle = .medium
      let dateStr = dateFormat.string(from: date)
      
      return dateStr
    }
    
    return nil
  }
}
