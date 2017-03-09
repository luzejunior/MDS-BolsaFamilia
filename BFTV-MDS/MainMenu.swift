//
//  MainMenu.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 12/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import UIKit

//View Controller Class to handle MainMenu Screen
class MainMenu: UIViewController{
    
    //Control Variables
    let iphoneModel = UIDevice.current.modelName
    
    //Outlets
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var newsButton: UIButton! //Outlet for "Noticias" Button.
    @IBOutlet weak var nisNumber: UILabel! //Outlet for display NIS Number.
    @IBOutlet weak var userName: UILabel! //Oulet for display User Name.
    @IBOutlet weak var mapsButton: UIButton!
    
    //Card Logged Off Outlets
    @IBOutlet weak var cardBackground_LoggedOff: UIImageView!
    @IBOutlet weak var labelOptions: UILabel!
    @IBOutlet weak var labelInsertNIS: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    //Constraints
    @IBOutlet weak var cardHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var label1TopCardImage: NSLayoutConstraint!
    @IBOutlet weak var label2TopLabel1: NSLayoutConstraint!
    
    //Menu Outlets
    @IBOutlet weak var dividerMenu: UIImageView!
    @IBOutlet weak var calendarButton: UIButton!
    
    //----------------- Screen State Functions -----------------\\
    
    //This function will be called before Screen load.
    //It will set the labels, constraints and screen configurations.
    override func viewWillAppear(_ animated: Bool) {
        self.nisNumber.text = "NIS " + UtilVariables.nisNumber //Set NIS number text
        self.userName.text = UtilVariables.userName //Set User Name Text
        self.messageButton.setTitle("2 não Lidas", for: UIControlState.normal) //Set Message button title to "Mensagens"
        self.newsButton.setTitle("Noticias", for: UIControlState.normal) //Set News Button title
        self.mapsButton.setTitle("Mapa", for: UIControlState.normal)
        self.resizeOutletsandConstraints()
        if !(UtilVariables.isNisValid) {
            self.cardBackground_LoggedOff.fadeIn(0.5 ,completion: {
                (finished: Bool) -> Void in
                self.cardImage.fadeIn(0.5, completion: {
                    (finished: Bool) -> Void in
                    self.labelOptions.fadeIn(0.5)
                    self.labelInsertNIS.fadeIn(0.9)
                })
            })
        } else{
            self.cardBackground_LoggedOff.image = UIImage(named: "orangeRetangule")
            self.cardBackground_LoggedOff.fadeIn(0.5)
        }
    }
    
    //Function to resize buttons and change constraints on hard code.
    func resizeOutletsandConstraints(){
        print(iphoneModel)
        if iphoneModel == "iPhone 4s" || iphoneModel == "iPhone 4"{
            self.cardHorizontalConstraint.constant = CGFloat(90)
            self.label1TopCardImage.constant = CGFloat(10)
            self.label2TopLabel1.constant = CGFloat(3)
        }
        else if iphoneModel == "iPhone 7" || iphoneModel == "iPhone 6s" || iphoneModel == "iPhone 6"{
            self.cardHorizontalConstraint.constant = CGFloat(120)
        }
    }
    
    //This function is called when the Screen load
    //It will set the screen title in navigation bar to "Bolsa Familia"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bolsa Familia" //Set Navigation Bar to "Bolsa Familia"
    }
    
    //----------------- Segue Functions -----------------\\
    
    //Function for prepare variables and texts for the next screen.
    //Segue is the transition for the next screen.
    //In this case, this function will change the back button in navigation bar of the next screen to empty string.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem() //Create an variable to handle the BarButton Item, in this case, the back button.
        backItem.title = "" //Set the back button title to empty. If you remove this code line, the next screen will show the title "Bolsa Familia" after the back button.
        navigationItem.backBarButtonItem = backItem //Set the next screen navigation item back button to our new created back button.
    }
}
