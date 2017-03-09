//
//  Messages.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 14/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation

class Messages{
    
    private var warningType = String()
    private var warningTitle = String()
    private var warningDate = String()
    private var warningMainText = String()
    
    init(_type: String, _title: String, _date: String, _mainText: String) {
        self.setWarningType(type: _type)
        self.setWarningTitle(title: _title)
        self.setWarningDate(date: _date)
        self.setWarningMainText(mainText: _mainText)
    }
    
    func setWarningType(type: String){
        self.warningType = type
    }
    
    func setWarningDate(date: String){
        self.warningDate = date
    }
    
    func setWarningTitle(title: String){
        self.warningTitle = title
    }
    
    func setWarningMainText(mainText: String){
        self.warningMainText = mainText
    }
    
    func getWarningType() -> String{
        return self.warningType
    }
    
    func getWarningData() -> String{
        return self.warningDate
    }
    
    func getWarningTitle() -> String{
        return self.warningTitle
    }
    
    func getWarningMainText() -> String{
        return self.warningMainText
    }

}
