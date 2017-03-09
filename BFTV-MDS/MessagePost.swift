//
//  MessagePost.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 12/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import UIKit

class MessagePost: UIViewController{
    
    //Variables
    var selectedRowIndex = Int() //Variable to handle the selected index in the previous screen. It will be seted in Prepare for Segue of NewsList Class.
    
    //Outlets
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var mainTextPost: UILabel!
    
    //----------------- Screen State Functions -----------------\\
    
    //This function will be called before Screen load.
    override func viewWillAppear(_ animated: Bool) {
        self.datePost.text = "Publicado em: " + UtilVariables.mensagens[self.selectedRowIndex].getWarningData() //Set date post
        self.mainTextPost.text = UtilVariables.mensagens[self.selectedRowIndex].getWarningMainText() //Set the main news text label.
        self.mainTextPost.sizeToFit() //Make label size fit text size.
    }
    
    //This function is called when Screen loads.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
