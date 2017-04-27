//
//  SearchBarExtension.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 26/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    var textField: UITextField? {
        
        func findInView(_ view: UIView) -> UITextField? {
            for subview in view.subviews {
                print("checking \(subview)")
                if let textField = subview as? UITextField {
                    return textField
                }
                else if let v = findInView(subview) {
                    return v
                }
            }
            return nil
        }
        
        return findInView(self)
    }
}
