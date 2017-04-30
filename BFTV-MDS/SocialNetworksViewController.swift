//
//  SocialNetworksViewController.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 29/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit

class SocialNetworksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let socialNetworks: [String] = [
    "Facebook",
    "Twitter",
    "Youtube",
    "SoudCloud",
    "Flickr"
    ]
    
    let socialNetworksAddress: [String] = [
    "@mindesenvolvimentosocial",
    "MinSocial",
    "/mdscomunicacao",
    "/desenvolvimentosocial",
    "/mdscomunicacao"
    ]
    
    let socialNetworksIcons: [String] = [
        "icon_fb",
        "icon_tw",
        "icon_yt",
        "icon_sc",
        "icon_fl"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Redes Sociais"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return socialNetworks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SocialNetworkCell
        cell.sc_name.text = socialNetworks[indexPath.row]
        cell.sc_address.text = socialNetworksAddress[indexPath.row]
        cell.sc_image.image = UIImage(named: socialNetworksIcons[indexPath.row])
        return cell
    }
}
