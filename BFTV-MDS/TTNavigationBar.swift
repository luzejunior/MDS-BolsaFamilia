//
//  TTNavigationBar.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 08/03/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit

class TTNavigationBar: UINavigationBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 65)
    }
    
}
