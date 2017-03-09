//
//  News.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 13/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation

class News{
    
    private var date = String()
    private var title = String()
    private var mainText = String()
    
    init(_date: String, _title: String, _mainText: String){
        self.date = _date
        self.title = _title
        self.mainText = _mainText
    }
    
    func setDate(_date: String){
        self.date = _date
    }
    
    func setTitle(_title: String){
        self.title = _title
    }
    
    func setMainText(_mainText: String){
        self.mainText = _mainText
    }
    
    func getData() -> String{
        return self.date
    }
    
    func getTitle() -> String{
        return self.title
    }
    
    func getMainText() -> String{
        return self.mainText
    }
}
