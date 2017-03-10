//
//  LoginScreen.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 11/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import UIKit

//Class to handle the first Login Screen.
class LoginScreen: UIViewController{
    
    //Control Variables
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil) //Constant to storyBoard screens workflow.
    
    //Outlets
    @IBOutlet weak var label1: UILabel! //Outlet for "Insira o seu número NIS" Label.
    @IBOutlet weak var textField1: UITextField! //Outlet for Text Field 1.
    @IBOutlet weak var loginButton: UIButton! //Outlet for "Entrar" Button.
    
    //----------------- Screen State Functions -----------------\\
    
    //This function will be called before Screen load.
    //It will set the labels, constraints and screen configurations.
    //Text Field 1 will only accept Number input with max lenght 11.
    override func viewWillAppear(_ animated: Bool) {
        self.label1.text = "Insira o seu numero NIS" //Insert String in Text Label.
        self.textField1.maxLength = 11 //Set the max number of characters in textField1 to 11.
        self.textField1.keyboardType = UIKeyboardType.numberPad //Set the keyboard type to numberPad.
        self.addDoneButtonOnKeyboard() //Method to add "Pronto" Button to Numeric Pad.
        self.loginButton.setTitle("Entrar", for:UIControlState.normal) //Set button title to "Entrar".
//        let height: CGFloat = 65 //whatever height you want
//        let bounds = navigationBar.bounds
//        self.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: height)
//        self.navBarTitle.title = "Bolsa Familia"
//        self.navBarTitle.titleView?.tintColor = UIColor.white
    }
    
    //This function is called when the Screen load
    //It will call the method to add Done Button to Numeric Pad Keyboard.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //----------------- Button Action Functions -----------------\\
    
    //Function to Handle login button.
    //Onclick the function will authenticate the user.
    //Search for NIS Number and if NIS is valid, the user will be chaged to the main application screen
    //If the NIS is invalid a message will appear in screen to user change the NIS number.
    @IBAction func onLoginButtonClicked(_ sender: Any) {
        //UtilVariables.nisNumber = textField1.text! //Global Variable nisNumber.
        //Check if NIS is valid.
        if UtilVariables.nisNumber == "10120380142"{ //If NIS Number was found, send
            //let nextView = storyBoard.instantiateViewController(withIdentifier: "Screen1Nav") as! UINavigationController
                UtilVariables.isNisValid = true
                dismiss(animated: true, completion: nil)
                popoverPresentationController?.delegate?.popoverPresentationControllerDidDismissPopover?(popoverPresentationController!)
            //self.present(nextView, animated: true, completion: nil)
        }else if UtilVariables.nisNumber == ""{ //If NIS is empty, throw an error message.
            let messageAlert = UIAlertController(title: "Erro", message: "Você não digitou um número NIS.", preferredStyle: UIAlertControllerStyle.alert)
            messageAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(messageAlert, animated: true, completion: nil)
        }else if UtilVariables.nisNumber.characters.count < textField1.maxLength { //If NIS is less than 11 numbers, throw an error message.
            let messageAlert = UIAlertController(title: "Erro", message: "O número NIS é inválido.", preferredStyle: UIAlertControllerStyle.alert)
            messageAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(messageAlert, animated: true, completion: nil)
        }else{ //If NIS is invalid, throw an error message.
            let messageAlert = UIAlertController(title: "Erro", message: "Seu numero NIS não foi encontrado.", preferredStyle: UIAlertControllerStyle.alert)
            messageAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(messageAlert, animated: true, completion: nil)
        }
    }
    
    //----------------- Other Functions -----------------\\
    
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
        let done: UIBarButtonItem = UIBarButtonItem(title: "Pronto", style: UIBarButtonItemStyle.done, target: self, action: #selector(LoginScreen.doneButtonAction))
        
        //Create an array of BarButtonItens and append space and buttons.
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        //Add to toolbar the previous itens and set size to fit screen.
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        //Include the Toolbar in textField1 outlet.
        //self.textField1.inputAccessoryView = doneToolbar
    }
    
    //Function to handle "Done" button click.
    //It will be called when you press "Pronto" button in keyboard application.
    func doneButtonAction() {
        self.textField1.resignFirstResponder()
    }
}
