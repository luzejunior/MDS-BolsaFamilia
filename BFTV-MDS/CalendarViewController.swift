//
//  CallendarViewController.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 04/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController, JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource{
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var nisTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nisTextField.addDoneButtonOnKeyboard()
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.registerCellViewXib(file: "CellView") // Registering your cell is manditory
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let endDate = formatter.date(from: "2018 01 01")! // You can use date generated from a formatter
        let startDate = Date()                                // You can also use dates created from this function
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
            calendar: Calendar.current,
            generateInDates: .forAllMonths,
            generateOutDates: .tillEndOfGrid,
            firstDayOfWeek: .sunday)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
        let myCustomCell = cell as! CellView
        
        // Setup Cell text
        myCustomCell.dayLabel.text = cellState.text
        myCustomCell.dayLabel.sizeToFit()
        print(cellState.date)
        
        // Setup text color
        if date.isEqual(to: Date()){
            myCustomCell.dayLabel.textColor = UIColor.red
            print("Entrei aqui!")
        }
        else if cellState.dateBelongsTo == .thisMonth {
            myCustomCell.dayLabel.textColor = UIColor.black
        } else {
            myCustomCell.dayLabel.textColor = UIColor.gray
        }
    }
}
