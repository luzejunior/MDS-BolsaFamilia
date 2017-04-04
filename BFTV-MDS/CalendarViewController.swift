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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.registerCellViewXib(file: "CellView") // Registering your cell is manditory
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let startDate = formatter.date(from: "2017 02 01")! // You can use date generated from a formatter
        let endDate = Date()                                // You can also use dates created from this function
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
        
        // Setup text color
        //if cellState.dateBelongsTo == .thisMonth {
        myCustomCell.dayLabel.textColor = UIColor.black
        //} else {
        //    myCustomCell.dayLabel.textColor = UIColor.gray
        //}
    }
}
