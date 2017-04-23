//
//  UserByNisClass.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 18/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation

class UserByNisClass: NSObject, NSCoding{
    
    struct PropertyKey {
        static let _id = "_id"
        static let nisKey = "nis"
        static let cepKey = "cep"
        static let poiKey = "pointsOfInterest"
        static let mapURIKey = "staticMapURI"
        static let coordinatesKey = "coordinates"
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("UserByNis")
    
    private var _id: String!
    private var nis: String!
    private var cep: String!
    private var pointsOfInterest: [[String: AnyObject]]!
    private var staticMapURI: String!
    private var coordinates: [String: AnyObject]!
    
    var getId: String{
        return _id
    }
    
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
        
        if item["_id"] != nil{
            self._id = item["_id"] as? String
        }else{
            self._id = ""
        }
        
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
    
    init(_id: String?, nis: String?, cep: String?, pointsOfInterest: [[String: AnyObject]]?, staticMapURI: String?, coordinates: [String: AnyObject]?){
        self._id = _id
        self.nis = nis
        self.cep = cep
        self.pointsOfInterest = pointsOfInterest
        self.staticMapURI = staticMapURI
        self.coordinates = coordinates
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let _id = aDecoder.decodeObject(forKey: PropertyKey._id) as? String
        let nis = aDecoder.decodeObject(forKey: PropertyKey.nisKey) as? String
        let cep = aDecoder.decodeObject(forKey: PropertyKey.cepKey) as? String
        let pointsOfInterest = aDecoder.decodeObject(forKey: PropertyKey.poiKey) as? [[String: AnyObject]]
        let staticMapURI = aDecoder.decodeObject(forKey: PropertyKey.mapURIKey) as? String
        let coordinates = aDecoder.decodeObject(forKey: PropertyKey.coordinatesKey) as? [String: AnyObject]

        self.init(_id: _id, nis: nis, cep: cep, pointsOfInterest: pointsOfInterest, staticMapURI: staticMapURI, coordinates: coordinates)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._id, forKey: PropertyKey._id)
        aCoder.encode(self.nis, forKey: PropertyKey.nisKey)
        aCoder.encode(self.cep, forKey: PropertyKey.cepKey)
        aCoder.encode(self.pointsOfInterest, forKey: PropertyKey.poiKey)
        aCoder.encode(self.staticMapURI, forKey: PropertyKey.mapURIKey)
        aCoder.encode(self.coordinates, forKey: PropertyKey.coordinatesKey)
    }
}
