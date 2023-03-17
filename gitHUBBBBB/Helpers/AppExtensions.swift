//
//  AppExtensions.swift
//  gitHUBBBBB
//
//  Created by Admin on 17/03/23.


import Foundation
import UIKit

// MARK: String
extension String {
    func convertDateStringFormat(from fromFormat: String, to toFormat: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = fromFormat
        
        if let date = inputFormatter.date(from: self) {
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = toFormat
            
            return outputFormatter.string(from: date)
        }
        
        return nil
    }
    func validatePhone(value: String) -> Bool {
        let PHONE_REGEX = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}$"#
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$&*])(?=.*[0-9]).{8,20}$")
        return passwordTest.evaluate(with: password)
    }
    func CGFloatValue() -> CGFloat? {
        guard let doubleValue = Double(self) else {
            return nil
        }
        return CGFloat(doubleValue)
    }
    
    func slice(from: String, to: String) -> String? {
        guard let rangeFrom = range(of: from)?.upperBound else { return nil }
        guard let rangeTo = self[rangeFrom...].range(of: to)?.lowerBound else { return nil }
        return String(self[rangeFrom..<rangeTo])
    }
}

// MARK: UIDevice
extension UIDevice {
    /// Returns `true` if the device has a notch
    var hasNotch: Bool {
        guard #available(iOS 11.0, *), let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return false }
        if UIDevice.current.orientation.isPortrait {
            return window.safeAreaInsets.top >= 44
        } else {
            return window.safeAreaInsets.left > 0 || window.safeAreaInsets.right > 0
        }
    }
}

// MARK: NSObject
extension NSObject {
    var bundleId: String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    class var className: String {
        return String(describing: self)
    }
    
    var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    var appName: String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
//    func instantiate<T: UIViewController>(type: T.Type, storyBoard: Storyboard) -> T {
//        let storyboard = UIStoryboard(name: storyBoard.rawValue, bundle: nil)
//        return storyboard.instantiateViewController(withIdentifier: type.className) as! T
//    }
}

// MARK: UIView
extension UIView {
    func roundCorners(corners: CACornerMask, cornerRadius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = corners
    }
    
    func addBlurView(_ style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.insertSubview(blurEffectView, at: 0)
    }
    //    func lookForSuperviewOfType<T: UIView>(type: T.Type) -> T? {
    //        return superview as? T ?? superview?.lookForSuperviewOfType(type: type)
    //    }
}
// MARK: UIView
public extension UIView
{
    static func loadFromXib<T>(withOwner: Any? = nil, options: [UINib.OptionsKey : Any]? = nil) -> T where T: UIView
    {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
}
// MARK: UIWindow
extension UIWindow {
    static var key: UIWindow? {
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    }
}
// MARK: UITextView
//extension UITextView {
//
////    func setPlaceholder(_ placeHolder: String) {
////
////        let placeholderLabel = UILabel()
////        placeholderLabel.text = placeHolder
////        placeholderLabel.font = UIFont(name: "Cormorant-Regular", size: 19)
////        placeholderLabel.sizeToFit()
////        placeholderLabel.tag = 222
////        placeholderLabel.frame.origin = CGPoint(x: 5, y: (self.font?.pointSize)! / 2)
////        placeholderLabel.textColor = UIColor.black.withAlphaComponent(0.3)
////        placeholderLabel.isHidden = !self.text.isEmpty
////
////        self.addSubview(placeholderLabel)
////    }
//
////    func checkPlaceholder() {
////        let placeholderLabel = self.viewWithTag(222) as! UILabel
////        placeholderLabel.isHidden = !self.text.isEmpty
////    }
//
//}

// MARK: Collection
extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

// MARK: UINavigationController
extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return visibleViewController?.preferredStatusBarStyle ?? .default
    }
}
// MARK: Notification.Name
extension Notification.Name {
    static let unAuthorized = Notification.Name("accessToken_expired")
}
// MARK: Array
//extension Array{
//    public mutating func appendDistinct<S>(contentsOf newElements: S, where condition:@escaping (Element, Element) -> Bool) where S : Sequence, Element == S.Element {
//        newElements.forEach { (item) in
//            if !(self.contains(where: { (selfItem) -> Bool in
//                return !condition(selfItem, item)
//            })) {
//                self.append(item)
//            }
//        }
//    }
//}
// MARK: NSLayoutConstraint
//extension NSLayoutConstraint {
//    /**
//     Change multiplier constraint
//
//     - parameter multiplier: CGFloat
//     - returns: NSLayoutConstraint
//     */
//    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
//
//        NSLayoutConstraint.deactivate([self])
//
//        let newConstraint = NSLayoutConstraint(
//            item: firstItem,
//            attribute: firstAttribute,
//            relatedBy: relation,
//            toItem: secondItem,
//            attribute: secondAttribute,
//            multiplier: multiplier,
//            constant: constant)
//
//        newConstraint.priority = priority
//        newConstraint.shouldBeArchived = self.shouldBeArchived
//        newConstraint.identifier = self.identifier
//
//        NSLayoutConstraint.activate([newConstraint])
//        return newConstraint
//    }
//}
// MARK: UILabel
//extension UILabel {
//    var isTruncated: Bool {
//
//        guard let labelText = text else {
//            return false
//        }
//
//        let labelTextSize = (labelText as NSString).boundingRect(
//            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
//            options: .usesLineFragmentOrigin,
//            attributes: [.font: font],
//            context: nil).size
//
//        return labelTextSize.height > bounds.size.height
//    }
//}
// MARK: UIImage
extension UIImage {
    func withAlpha(_ alpha: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(at: .zero, blendMode: .normal, alpha: alpha)
        }
    }
}
// MARK: URL
extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
