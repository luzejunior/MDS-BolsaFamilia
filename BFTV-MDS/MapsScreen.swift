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
class MapsScreen: UIViewController{
    
    //Variables
    var places: GMSPlacesClient?
    
    //----------------- Screen State Functions -----------------\\
 
    //This function will be called when the screen load.
    //In this class it will instantiate the google maps and display in this viewController.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = GMSPlacesClient() //Instantiate places to load pins on map.
        
        self.title = "Mapa" //Set the title of the screen to "Mapa"
        
        //Initializing maps:
        let camera = GMSCameraPosition.camera(withLatitude: -7.11532, longitude: -34.861, zoom: 10) //Define a camera for map. 
                                                                                                    //This function receives the latitude, longitude and zoom for the camera.
                                                                                                    //In this case it will show "Joao Pessoa" as default.
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera) //Instantiate map in all screen and using camera defined above.
        mapView.isMyLocationEnabled = true //Enable user location.
        self.view = mapView //Show map on this view.
    }
}
