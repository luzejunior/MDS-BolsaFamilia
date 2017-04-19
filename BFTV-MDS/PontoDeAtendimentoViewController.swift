//
//  PontoDeAtendimentoViewController.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 31/03/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class PontoDeAtendimentoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var _cep: String!
    var _latitude: NSNumber!
    var _longitude: NSNumber!
    var _Entrys: [UserByNisClass] = []
    
    @IBOutlet weak var CPFTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onPesquisarClicked(_ sender: Any) {
        _cep = CPFTextField.text!
        print("Requested CEP: \(_cep!)")
        //let parameters: Parameters = [
        //    "nis" : "\(UtilVariables.nisNumber)",
        //    "cep" : "\(_cep!)"
        //]
        //let url = "http://maps.google.com/maps/api/geocode/json?address=\(_cep!)&sensor=true"
        //let url = "localhost:8080/users"
        let url = "http://187.64.87.114:3000/users/55296230"
        //Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value {
                let data = json as! [[String: AnyObject]]
                for item in data{
                    let entry = UserByNisClass(item: item)
                    self._Entrys.append(entry)
                }
                print(self._Entrys[1].getCoordinates)
                //let data = json as! NSD
                //let User = UserByNisClass(item: data)
                //print(User.getCep)
            }
//            if let json = response.result.value {
//                let dicJson = json as! NSDictionary
//                let results = dicJson.object(forKey: "results") as! NSArray
//                let resultsDictionary = results.object(at: 0) as! NSDictionary
//                let geometry = resultsDictionary.object(forKey: "geometry") as! NSDictionary
//                let locations = geometry.object(forKey: "location") as! NSDictionary
//                self._latitude = locations.object(forKey: "lat") as! NSNumber
//                self._longitude = locations.object(forKey: "lng") as! NSNumber
//                print("Found Latitude: \(self._latitude!)")
//                print("Found Longitude: \(self._longitude!)")
//            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Address Cell") as! AddressCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
