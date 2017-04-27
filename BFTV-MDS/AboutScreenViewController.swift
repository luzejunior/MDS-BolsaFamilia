//
//  AboutScreenViewController.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 27/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit

class AboutScreenViewController: UIViewController, UITableViewDataSource, UITabBarDelegate{
    
    let titles: [String] = [
        "Quem tem direito ao Bolsa Familia?",
        "Como se cadastrar?",
        "Valores do Beneficio",
        "Direitos e Deveres"
    ]
    
    let images: [String] = [
        "icon_energia",
        "icon_feliz"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
