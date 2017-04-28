//
//  loginScreenController.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 28/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit

protocol LoginScreenDelegate: class {
    func checkNis()
}

class loginScreenController: UIView{
    
    @IBOutlet weak var textField: UITextField!
    weak var lsDelegate: LoginScreenDelegate?
    
    override func awakeFromNib() {
        textField.maxLength = 11
        textField.keyboardType = .numberPad
        textField.addDoneButtonOnKeyboard()
    }
    
    @IBAction func onConfirmarClick(_ sender: Any) {
        //UtilVariables.nisNumber = textField.text! //Global Variable nisNumber.
        //Check if NIS is valid.
        lsDelegate?.checkNis()
        if UtilVariables.isNisValid {
            if let superView = self.superview as? PopupContainer {
                (superView ).close()
            }
            
        }
    }
    
    @IBAction func onExitClick(_ sender: Any) {
        if let superView = self.superview as? PopupContainer {
            (superView ).close()
        }
    }
    
    
}
