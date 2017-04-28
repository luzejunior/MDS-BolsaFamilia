//
//  AboutScreenViewController.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 27/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit

class AboutScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    let titles: [String] = [
        "Quem tem direito ao Bolsa Familia?",
        "Como se cadastrar?",
        "Valores do Beneficio",
        "Direitos e Deveres"
    ]
    
    let images: [String] = [
        "icon_question",
        "icon_cadastro",
        "icon_money",
        "icon_check"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AboutCell
        cell.cellImage.image = UIImage(named: images[indexPath.row])
        cell.cellTitle.text = titles[indexPath.row]
        return cell
    }
}
