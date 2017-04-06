//
//  CallendarViewController.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 04/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import UIKit
import JTAppleCalendar

//Class to CallendarViewController
class CalendarViewController: UIViewController, JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource{
    
    //Outlets
    @IBOutlet weak var calendarView: JTAppleCalendarView! //Outlet for Calendar View
    @IBOutlet weak var nisTextField: UITextField! //Outlet for Nis TextField
    
    var monthDateArray: [Date]! //Array of dates
    var monthFlag: Bool = false //Flag to know if user inputed the Last Nis Number
    
    //#############################################################################
    //----------------- Screen State Functions -----------------\\
    //#############################################################################
    
    //Function to be called when screens load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nisTextField.addDoneButtonOnKeyboard() //Adding Done button to keyboard
        calendarView.dataSource = self //Data Source to calendar View
        calendarView.delegate = self //Calendar view delegate
        calendarView.registerCellViewXib(file: "CellView") //Cell view Registration
    }
    
    //#############################################################################
    //----------------- Calendar Functions -----------------\\
    //#############################################################################
    
    //Calendar configuration
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter() //Data Formatter
        formatter.dateFormat = "yyyy MM dd" //Data formate
        
        let endDate = formatter.date(from: "2017 12 31")! //End of calendar date
        let startDate = Date() //Today date
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6,
                                                 calendar: Calendar.current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .tillEndOfGrid,
                                                 firstDayOfWeek: .sunday) //Calendar Configurations
        return parameters //Return
    }
    
    //This function is called for every cell in Calendar
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
        let myCustomCell = cell as! CellView
        
        // Setup Cell text
        myCustomCell.dayLabel.text = cellState.text
        myCustomCell.dayLabel.sizeToFit()
        //print(cellState.date)
        
        print(self.monthFlag)
        
        // Setup text color
        if date.isEqual(to: Date()){
            myCustomCell.dayLabel.textColor = UIColor.red
            print("Entrei aqui!")
        }
        else if cellState.dateBelongsTo == .thisMonth { //If color belogs to this month
            myCustomCell.dayLabel.textColor = UIColor.black //Set color to Black
            if self.monthFlag{ //If flag is true
                if cellState.date.isElement(of: self.monthDateArray) { //If cell date is in month date array
                    myCustomCell.dayLabel.textColor = UIColor.green //Set color to green
                }
            }
        } else { //If belongs to other month
            myCustomCell.dayLabel.textColor = UIColor.gray //Set color to gray
        }
    }
    
    //#############################################################################
    //----------------- Buttons Action Functions -----------------\\
    //#############################################################################
    
    //When Acessar button clicked, this function will be throw
    @IBAction func onAcessarClicked(_ sender: Any) {
        if self.nisTextField.text == "" { //If text is empty
            let alert = UtilFunctions.createMessageAlert(title: "Erro", message: "Por Favor, digite o ultimo número do seu NIS", title2: "Ok")
            self.present(alert, animated: true, completion: nil) //Create and present alert view.
        }
        else if (Int(self.nisTextField.text!)! < 10){ //If text is bellow 10
            self.monthDateArray = NisPaymentDate.determinePaymentDates(nisLastNumber: self.nisTextField.text!) //Mount the array with dates
            self.monthFlag = true //Set flag to true
            self.view.endEditing(true) //Dismiss keyboard
            self.calendarView.reloadData() //Reload Calendar data
        }
        else{ //If text is above 10
            let alert = UtilFunctions.createMessageAlert(title: "Erro", message: "Número inválido", title2: "Ok")
            self.present(alert, animated: true, completion: nil) //Create and presente alert view
            self.nisTextField.text = "" //Set text field to empty
        }
    }
    
}
