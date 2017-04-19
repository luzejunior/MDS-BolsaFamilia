//
//  UserByNisClass.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 18/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation

class UserByNisClass{
    
    private var nis: String!
    private var cep: String!
    private var pointsOfInterest: [[String: AnyObject]]!
    private var staticMapURI: String!
    private var coordinates: [String: AnyObject]!
    
    var getNis: String{
        return nis
    }
    
    var getCep: String{
        return cep
    }
    
    var getPOI: [[String: AnyObject]]{
        return pointsOfInterest
    }
    
    var getStaticMap: String{
        return staticMapURI
    }
    
    var getCoordinates: [String: AnyObject]{
        return coordinates
    }
    
    init(item: [String: AnyObject]){
        if item["nis"] != nil{
            self.nis =  item["nis"] as? String
        }else{
            self.nis = ""
        }
        
        if item["cep"] != nil{
            self.cep =  item["cep"] as? String
        }else{
            self.cep = ""
        }
        
        if item["pointsOfInterest"] != nil{
            self.pointsOfInterest =  item["pointsOfInterest"] as? [[String: AnyObject]]
        }else{
            self.pointsOfInterest = [["":"" as AnyObject]]
        }
        
        if item["staticMapURI"] != nil{
            self.staticMapURI =  item["staticMapURI"] as? String
        }else{
            self.staticMapURI = ""
        }
        
        if item["coordinates"] != nil{
            self.coordinates =  item["coordinates"] as? [String: AnyObject]
        }else{
            self.coordinates = ["":"" as AnyObject]
        }
    }
}
