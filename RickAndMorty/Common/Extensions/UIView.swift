//
//  UIView.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
