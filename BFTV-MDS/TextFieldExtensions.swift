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
    
    //Function to add Done button to Numeric Keyboard.
    //By default, the iPhone keyboard does'nt have an "Done" button, so the keyboard appear and never desappear.
    //This function solves that problem by creating an toolbar and adding the done button.
    func addDoneButtonOnKeyboard() {
        //Create Toolbar and set style to default.
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        //Create an Bar Button item called "done" which will be the main button.
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        //At Selection Done button, the "doneButtonAction" will be called
        let done: UIBarButtonItem = UIBarButtonItem(title: "Pronto", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneButtonAction))
        
        //Create an array of BarButtonItens and append space and buttons.
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        //Add to toolbar the previous itens and set size to fit screen.
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        //Include the Toolbar in textField1 outlet.
        inputAccessoryView = doneToolbar
    }
    
    //Function to handle "Done" button click.
    //It will be called when you press "Pronto" button in keyboard application
    func doneButtonAction(textField: UITextField) {
        resignFirstResponder()
    }
    
}
