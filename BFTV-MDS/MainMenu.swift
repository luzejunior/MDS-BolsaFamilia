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
class MainMenu: UIViewController, UIPopoverPresentationControllerDelegate{
    
    //Control Variables
    let iphoneModel = UIDevice.current.modelName //Get iPhone Model.
    let _storyboard = UIStoryboard(name: "Main", bundle: nil) //Get Main Storyboard.
    
    //Outlets
    @IBOutlet weak var messageButton: UIButton! //Outlet for "Message" Button.
    @IBOutlet weak var newsButton: UIButton! //Outlet for "Noticias" Button.
    @IBOutlet weak var nisNumber: UILabel! //Outlet for display NIS Number.
    @IBOutlet weak var userName: UILabel! //Oulet for display User Name.
    @IBOutlet weak var mapsButton: UIButton! //Outlet for maps button on main screen.
    
    //Card Logged Off Outlets
    @IBOutlet weak var cardBackground_LoggedOff: UIImageView! //Card Background Image.
    @IBOutlet weak var labelOptions: UILabel! //Options label.
    @IBOutlet weak var labelInsertNIS: UILabel! //Insert Nis Label.
    @IBOutlet weak var cardImage: UIImageView! //Credit Card Image.
    //Constraints
    @IBOutlet weak var cardHorizontalConstraint: NSLayoutConstraint! //Constraint for Horizontal Size.
    @IBOutlet weak var label1TopCardImage: NSLayoutConstraint! //Constraint for margin top from Credit Card Image to Options Label.
    @IBOutlet weak var label2TopLabel1: NSLayoutConstraint! //Constraint for margin top from Options label to insert NIS Label.
    
    //Card Logged In Outlets
    @IBOutlet weak var messageDivider: UIImageView! //Divider to separate two sections in task bar.
    @IBOutlet weak var parcelasButton: UIButton! //Number of parcelas button.
    @IBOutlet weak var nextPaymentLabel: UILabel! //NextPayment Label.
    @IBOutlet weak var dateLabel: UILabel! //Date Label.
    //Constraints
    
    
    //Menu Outlets
    @IBOutlet weak var dividerMenu: UIImageView! //Divider Image to icons menu background.

    //#############################################################################
    //----------------- Screen State Functions -----------------\\
    //#############################################################################
    
    //This function will be called before Screen load.
    //It will set the labels, constraints and screen configurations.
    override func viewWillAppear(_ animated: Bool) {
        //Setting Buttons and Texts:
        self.nisNumber.text = "NIS " + UtilVariables.nisNumber //Set NIS number text
        self.userName.text = UtilVariables.userName //Set User Name Text
        self.messageButton.setTitle("2 não Lidas", for: UIControlState.normal) //Set Message button title to "Mensagens"
        self.newsButton.setTitle("Noticias", for: UIControlState.normal) //Set News Button title
        self.mapsButton.setTitle("Mapa", for: UIControlState.normal) //Set Maps Button Title.
        
        //Resizing icons to fit screen size:
        self.resizeOutletsandConstraints()
        
        //Check if Nis is valid.
        if !(UtilVariables.isNisValid) {
            self.presentLoginOffScreen() //If Nis is invalid, call logged off screen.
        }else{
            self.presentLoginOnScreen() //If nis is valid, call logged in screen.
        }
    }
    
    //This function is called when the Screen load
    //It will set the screen title in navigation bar to "Bolsa Familia"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bolsa Familia" //Set Navigation Bar to "Bolsa Familia"
        
        //Creating Listener to check if user tapped in credit card image to open Login Screen:
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onCardImageClicked))
        self.cardImage.addGestureRecognizer(imageTapRecognizer)
        self.cardImage.isUserInteractionEnabled = true
    }
    
    //#############################################################################
    //----------------- Login Menu Card Presentation Functions -----------------\\
    //#############################################################################
    
    //This Function will dismiss the Logged off screen.
    func dismissUserLoggedOffMenu(){
        //Fade Out:
        self.cardImage.fadeOut(0.5)
        self.labelInsertNIS.fadeOut(0.5)
        self.labelOptions.fadeOut(0.5)
        self.cardBackground_LoggedOff.fadeOut(0.5)
        //Hidden Objects and Buttons:
        self.cardImage.isHidden = true
        self.labelInsertNIS.isHidden = true
        self.labelOptions.isHidden = true
    }
    
    //This Function will show the login elements.
    func presentLoginOffScreen(){
        //On completion Fade In, do Fade In in the other elements:
        self.cardBackground_LoggedOff.fadeIn(0.5 ,completion: {
            (finished: Bool) -> Void in
            self.cardImage.fadeIn(0.5, completion: {
                (finished: Bool) -> Void in
                self.labelOptions.fadeIn(0.5)
                self.labelInsertNIS.fadeIn(0.9)
            })
        })
    }
    
    //This Function will show the logged in screen elements.
    func presentLoginOnScreen(){
        //Make elements appear on screen:
        self.messageButton.isHidden = false
        self.messageDivider.isHidden = false
        self.parcelasButton.isHidden = false
        self.nextPaymentLabel.isHidden = false
        self.dateLabel.isHidden = false
        //Change Card to orange background:
        self.cardBackground_LoggedOff.image = UIImage(named: "orangeRetangule")
        //Fade In:
        self.cardBackground_LoggedOff.fadeIn(0.5, completion: {
            (finished: Bool) -> Void in
            self.nextPaymentLabel.fadeIn(0.5)
            self.dateLabel.fadeIn(0.5)
            self.messageButton.fadeIn(0.5)
            self.messageDivider.fadeIn(0.5)
            self.parcelasButton.fadeIn(0.5)
        })
    }
    
    //#############################################################################
    //----------------- Constraints Functions -----------------\\
    //#############################################################################
    
    //Function to resize buttons and change constraints on hard code.
    //This function changes the icons sizes and constraints constants to fit iPhones Screens sizes.
    func resizeOutletsandConstraints(){
        print(iphoneModel) //Debug the iPhone Model
        
        //For iPhones with 3.5 inch screens:
        if iphoneModel == "iPhone 4s" || iphoneModel == "iPhone 4"{
            self.cardHorizontalConstraint.constant = CGFloat(90)
            self.label1TopCardImage.constant = CGFloat(10)
            self.label2TopLabel1.constant = CGFloat(3)
        }
            
            //For iPhones with 4.7 inch screens:
        else if iphoneModel == "iPhone 7" || iphoneModel == "iPhone 6s" || iphoneModel == "iPhone 6"{
            self.cardHorizontalConstraint.constant = CGFloat(120)
        }
    }

    //#############################################################################
    //----------------- Segue Functions -----------------\\
    //#############################################################################
    
    //Function for prepare variables and texts for the next screen.
    //Segue is the transition for the next screen.
    //In this case, this function will change the back button in navigation bar of the next screen to empty string.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem() //Create an variable to handle the BarButton Item, in this case, the back button.
        backItem.title = "" //Set the back button title to empty. If you remove this code line, the next screen will show the title "Bolsa Familia" after the back button.
        navigationItem.backBarButtonItem = backItem //Set the next screen navigation item back button to our new created back button.
    }
    
    //#############################################################################
    //----------------- Buttons Actions Functions -----------------\\
    //#############################################################################
    
    //When user tapp at credit card image, this function will be called.
    //This function presents the popover presentation style, showing the login screen view in a popup allowing users to log in.
    func onCardImageClicked(){
        //Instantiate Storyboard:
        let popover = _storyboard.instantiateViewController(withIdentifier: "Login Screen") as! LoginScreen
        popover.modalPresentationStyle = UIModalPresentationStyle.popover //Set style to Popover.
        popover.preferredContentSize = CGSize(width: 300, height: 350) //Set Size of popover.
        let popoverViewController = popover.popoverPresentationController //Create a presentation controller.
        popoverViewController!.permittedArrowDirections = .any //Create the up arrow.
        popoverViewController!.delegate = self //Delegate itself actions.
        popoverViewController!.sourceView = self.view //Delegate the source view to thid view controller.
        popover.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 100, width: 1, height: 1) //Set the source of popover screen position.
        present(popover, animated: true, completion: nil) //Show Popover.
    }
    
    //#############################################################################
    //----------------- Popover Action Functions -----------------\\
    //#############################################################################

    //This function is called when popover is dismissed by user or by the popover view controller.
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
//        print(UtilVariables.isNisValid) //Debug Only
        //Check if Loggin was well succeded and show the logged in screen.
        if UtilVariables.isNisValid {
            self.dismissUserLoggedOffMenu()
            self.presentLoginOnScreen()
        }
//        print("Popover dismisssed") //Debug Only
    }
    
    //Adaptative popover style.
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
