//
//  Extension.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 24.07.22.
//

import Foundation
import UIKit

extension UIColor {
    
    static let lightGreyTone: UIColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
    static let fakeGreenTone: UIColor = UIColor(red: 0.38, green: 0.686, blue: 0.169, alpha: 1)
    static let lightGreen: UIColor = UIColor(red: 0.935, green: 0.969, blue: 0.911, alpha: 1)
    static let greenTone: UIColor = UIColor(red: 0.294, green: 0.514, blue: 0.392, alpha: 1)
    static let lightBlueTone: UIColor = UIColor(red: 0.901, green: 0.919, blue: 0.979, alpha: 1)
    static let blueTone: UIColor = UIColor(red: 0.337, green: 0.463, blue: 0.863, alpha: 1)
    static let lightOrangeTone: UIColor = UIColor(red: 0.988, green: 0.946, blue: 0.892, alpha: 1)
    static let orangeTone: UIColor = UIColor(red: 0.902, green: 0.705, blue: 0.298, alpha: 1)
    static let lightPurpleTone: UIColor = UIColor(red: 0.972, green: 0.908, blue: 0.972, alpha: 1)
    static let purpleTone: UIColor = UIColor(red: 0.647, green: 0.347, blue: 0.853, alpha: 1)
    static let greyTone: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
}

extension UIView {

    public func configureLabel(label:UILabel, text:String? = nil, textColor: UIColor? = nil, textAlignment: NSTextAlignment? ) {
        
        label.text = text
        label.textColor = textColor
        label.textAlignment = textAlignment ?? .left
    }
    
    func addTapGesture(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        //        tap.numberOfTapsRequired = 1
        
        tap.cancelsTouchesInView = true
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
    }

    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
    
    func hideKeyboard() {
        self.endEditing(true)
    }
}

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}

extension UIImageView {
    
    public func configureImage(imageView:UIImageView, contentMode: UIView.ContentMode?, image:UIImage? = nil) {
        
        imageView.image = image
        imageView.contentMode = contentMode ?? .scaleAspectFit
    }
}

extension UILabel {

    func configureLabel(text:String? = nil, textColor: UIColor? = nil, textAlignment: NSTextAlignment? ) {
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment ?? .left
    }
}
