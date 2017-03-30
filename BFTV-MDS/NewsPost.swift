//
//  NewsPost.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 12/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import UIKit

//ViewController to handle News Post Screen.
class NewsPost: UIViewController{
    
    //Variables
    var selectedRowIndex = Int() //Variable to handle the selected index in the previous screen. It will be seted in Prepare for Segue of NewsList Class.
    
    //Outlets
    @IBOutlet weak var datePost: UILabel! //Outlet to handle date of post.
    @IBOutlet weak var mainTextPost: UILabel! //Outlet for display the main news text.
    
    //#############################################################################
    //----------------- Screen State Functions -----------------\\
    //#############################################################################
    
    //This function will be called before Screen load.
    override func viewWillAppear(_ animated: Bool) {
        self.datePost.text = "Publicado em: " + UtilVariables.noticias[self.selectedRowIndex].getData() //Set date post
        self.mainTextPost.text = UtilVariables.noticias[self.selectedRowIndex].getMainText() //Set the main news text label.
        self.mainTextPost.sizeToFit() //Make label size fit text size.
    }
    
    //This function is called when Screen loads.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
