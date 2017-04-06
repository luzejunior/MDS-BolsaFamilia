//
//  UtilFunctions.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 06/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit

class UtilFunctions{
    
    class func createMessageAlert(title: String, message: String, title2: String) -> UIAlertController{
        let messageAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        messageAlert.addAction(UIAlertAction(title: title2, style: UIAlertActionStyle.cancel, handler: nil))
        return messageAlert
    }
    
}
