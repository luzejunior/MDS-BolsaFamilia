//
//  TextFieldMaxLengths.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 11/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import UIKit

//Private var for max lenght of characteres
private var maxLengths = [UITextField: Int]()

//Text Field extension.
extension UITextField {
    
    //maxLenght variable to handle XCode Inspector input number.
    @IBInspectable var maxLength: Int {
        get {
            guard let length = maxLengths[self] else {
                return Int.max
            }
            return length
        }
        set {
            maxLengths[self] = newValue
            addTarget(
                self,
                action: #selector(limitLength),
                for: UIControlEvents.editingChanged
            )
        }
    }
    
    //Limit number of characters and change string.
    func limitLength(textField: UITextField) {
        guard let prospectiveText = textField.text,
            prospectiveText.characters.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        text = prospectiveText.substring(to: maxCharIndex)
        selectedTextRange = selection
    }
    
}
