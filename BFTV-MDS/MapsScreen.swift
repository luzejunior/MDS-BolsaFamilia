//
//  MapsScreen.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 28/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import UIKit
import GoogleMaps
import GooglePlaces

//Class to handle Google Maps view controler interaction.
class MapsScreen: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapsView: GMSMapView!
    let locationManager = CLLocationManager()
    
    //Variables
    var places: GMSPlacesClient?
    
    //#############################################################################
    //----------------- Screen State Functions -----------------\\
    //#############################################################################
 
    //This function will be called when the screen load.
    //In this class it will instantiate the google maps and display in this viewController.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        places = GMSPlacesClient() //Instantiate places to load pins on map.
        
        self.title = "Mapa" //Set the title of the screen to "Mapa"
        
        self.createGPSScreen(latitude: -7.11532, longitude: -34.861, zoom: 10)

    }
    
    //#############################################################################
    //----------------- GPS Functions -----------------\\
    //#############################################################################
    
    //This function receives the latitude, longitude and zoom for the camera.
    //In this case it will show "Joao Pessoa" as default.
    func createGPSScreen(latitude: CLLocationDegrees, longitude: CLLocationDegrees, zoom: Float){
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: zoom) //Define a camera for map.
        self.mapsView.camera = camera
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            self.locationManager.startUpdatingLocation()
            self.mapsView.isMyLocationEnabled = true
            self.mapsView.settings.myLocationButton = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location Changed")
        if let locations = locations.first{
            //let new_coordinate = CLLocationCoordinate2DMake(locations.coordinate.latitude,locations.coordinate.longitude)
            //self.mapsView.animate(with: GMSCameraUpdate.setTarget(new_coordinate))
            self.mapsView.animate(to: GMSCameraPosition(target: locations.coordinate, zoom: 15, bearing: 0, viewingAngle: 0))
            print("Camera Position Changed")
            //locationManager.stopUpdatingLocation()
        }
    }
}
