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
import os.log
import GoogleMaps
import GooglePlaces

class PontoDeAtendimentoViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate{
    
    var _cep: String!
    var _latitude: NSNumber!
    var _longitude: NSNumber!
    var _Entrys: [UserByNisClass] = []
    @IBOutlet weak var MapImage: UIImageView!
    @IBOutlet weak var mapsView: GMSMapView!
    var _POI: [[String: AnyObject]]!
    
    let locationManager = CLLocationManager()
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    //Variables
    var places: GMSPlacesClient?
    
    @IBOutlet weak var CPFTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        places = GMSPlacesClient() //Instantiate places to load pins on map.
        self.CPFTextField.addDoneButtonOnKeyboard()
        let filePath = self.documentsPath.appendingPathComponent("UserByNis").path
        if FileManager.default.fileExists(atPath: filePath){
            self._Entrys = self.loadUser()!
            let coordinates = self._Entrys[0].getCoordinates as [String: AnyObject]
            if let latFloat = Float(coordinates["latitude"] as! String) {
                self._latitude = NSNumber(value:latFloat)
            }
            if let longFloat = Float(coordinates["longitude"] as! String) {
                self._longitude = NSNumber(value:longFloat)
            }
        }
        if(_Entrys.isEmpty){
            let parameters: Parameters = [
                "nis" : "\(UtilVariables.nisNumber)",
                "cep" : "\(_cep!)"
            ]
            let url = "http://187.64.87.114:3000/users/55555555555"
            //Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            Alamofire.request(url).responseJSON { response in
                if let json = response.result.value {
                    let data = json as! [[String: AnyObject]]
                    for item in data{
                        let entry = UserByNisClass(item: item)
                        self._Entrys.append(entry)
                    }
                    self.saveUsers()
                    self.saveImage()
                }
            }
        }else{
            self.checkInternetAndShowImageOrMap()
        }
    }
    
    @IBAction func onPesquisarClicked(_ sender: Any) {
        _cep = CPFTextField.text!
        print("Requested CEP: \(_cep!)")
        //let url = "http://maps.google.com/maps/api/geocode/json?address=\(_cep!)&sensor=true"
        //let url = "localhost:8080/users"
        self.checkInternetAndShowImageOrMap()
    }
    
    func checkInternetAndShowImageOrMap(){
        if Reachability.isConnectedToNetwork(){
            self.showMap()
        }else{
            self.showImage()
        }
    }
    
    func showMap(){
        if self.mapsView.isHidden{
            self.mapsView.isHidden = false
            self.MapImage.isHidden = true
            self.createGPSScreen(latitude: self._latitude as! CLLocationDegrees, longitude: self._longitude as! CLLocationDegrees, zoom: 16)
            self.setUpMarkers()
        }
    }
    
    func showImage(){
        if self.MapImage.isHidden{
            self.mapsView.isHidden = true
            self.MapImage.isHidden = false
            let filePath = self.documentsPath.appendingPathComponent("image.png").path
            if FileManager.default.fileExists(atPath: filePath) {
                self.MapImage.image = UIImage(contentsOfFile: filePath)
            }
        }
    }
    
    func saveImage(){
        let imgURL: NSURL = NSURL(string: self._Entrys[0].getStaticMap)!
        //Download an NSData representation of the image from URL
        let request: NSURLRequest = NSURLRequest(url: imgURL as URL)
        var _: NSURLConnection = NSURLConnection(request: request as URLRequest, delegate: self)!
        //Make request to download URL
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) { (response, Data, Error) in
            if !(Error != nil) {
                //set image to requested resource
                let image = UIImage(data: Data!)
                do {
                    let fileURL = self.documentsPath.appendingPathComponent("image.png")
                    if let pngImageData = UIImagePNGRepresentation(image!) {
                        try pngImageData.write(to: fileURL, options: .atomic)
                        print("ImageSaved")
                    }
                } catch {
                    print("Cannot Save Image")
                }
                
            } else {
                //If request fails...
                print("error: \(String(describing: Error?.localizedDescription))")
            }

        }
    }
    
    //#############################################################################
    //----------------- GPS Functions -----------------\\
    //#############################################################################
    
    func createGPSScreen(latitude: CLLocationDegrees, longitude: CLLocationDegrees, zoom: Float){
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: zoom) //Define a camera for map.
        self.mapsView.camera = camera
        let position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        var Marker = GMSMarker(position: position)
        Marker.title = "Local Atual";
        Marker.icon = GMSMarker.markerImage(with: .red)
        Marker.map = self.mapsView
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            self.locationManager.startUpdatingLocation()
            //self.mapsView.isMyLocationEnabled = true
            //self.mapsView.settings.myLocationButton = true
        }
    }
    
    func setUpMarkers(){
        self._POI = self._Entrys[0].getPOI
        for points in self._POI{
            let name = points["name"] as! String
            let latitude = Double(points["latitude"] as! String)
            let longitude = Double(points["longitude"] as! String)
            let position = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            var Marker = GMSMarker(position: position)
            Marker.title = name;
            Marker.icon = GMSMarker.markerImage(with: .green)
            Marker.map = self.mapsView
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location Changed")
        if let locations = locations.first{
            //let new_coordinate = CLLocationCoordinate2DMake(locations.coordinate.latitude,locations.coordinate.longitude)
            //self.mapsView.animate(with: GMSCameraUpdate.setTarget(new_coordinate))
            //self.mapsView.animate(to: GMSCameraPosition(target: locations.coordinate, zoom: 15, bearing: 0, viewingAngle: 0))
            print("Camera Position Changed")
            //locationManager.stopUpdatingLocation()
        }
    }
    
    //#############################################################################
    //----------------- Persist Data Functions -----------------\\
    //#############################################################################
    
    private func saveUsers(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(_Entrys, toFile: UserByNisClass.ArchiveURL.path)
        if isSuccessfulSave {
            if #available(iOS 10.0, *) {
                os_log("Successfully saved.", log: OSLog.default, type: .debug)
            } else {
                    print("Successfully saved.")
            }
        } else {
            if #available(iOS 10.0, *) {
                os_log("Failed to save.", log: OSLog.default, type: .error)
            } else {
                print("Failed to saved.")
            }
        }
    }
    
    private func loadUser() -> [UserByNisClass]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: UserByNisClass.ArchiveURL.path) as? [UserByNisClass]
    }
    

}
