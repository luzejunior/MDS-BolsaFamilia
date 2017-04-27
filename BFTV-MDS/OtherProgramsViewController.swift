//
//  OtherProgramsViewController.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 26/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit

class OtherProgramsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let titles: [String] = [
    "Tarifa Social de Energia Elétrica",
    "Criança Feliz"
    ]
    
    let descption: [String] = [
    "Programa que oferece desconto na conta de energia elétrica.",
    "Programa que incentiva as familias a cuidarem melhor das suas crianças."
    ]
    
    let images: [String] = [
    "icon_energia",
    "icon_feliz"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Outros Programas"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OtherProgramsCell
        cell.cellTitle.text = titles[indexPath.row]
        cell.cellDescription.text = descption[indexPath.row]
        cell.cellImage.image = UIImage(named: images[indexPath.row])
        return cell
    }
}
