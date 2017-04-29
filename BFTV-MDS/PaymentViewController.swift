//
//  paymentViewController.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 28/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit

class PaymentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let status: [String] = [
        "RECEBIDO",
        "RECEBIDO",
        "BLOQUEADO",
        "BLOQUEADO"
    ]
    
    let month: [String] = [
        "Janeiro 2017",
        "Fevereiro 2017",
        "Março 2017",
        "Abril 2017"
    ]
    
    let valores: [String] = [
        "R$77,00",
        "R$77,00",
        "R$0,00",
        "R$0,00"
    ]
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.00, green:0.75, blue:0.38, alpha:1.0)
        self.navigationController?.navigationBar.barTintColor = UIColor(hue: 0.1, saturation: 1.0, brightness: 1.2, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Extrato de Pagamento"
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.00, green:0.75, blue:0.38, alpha:1.0)
        self.navigationController?.navigationBar.barTintColor = UIColor(hue: 0.4, saturation: 1.0, brightness: 0.71, alpha: 1.0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return status.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PaymentCell
        cell.monthCell.text = month[indexPath.row]
        cell.statusCell.text = status[indexPath.row]
        cell.valueCell.text = valores[indexPath.row]
        if cell.statusCell.text == "RECEBIDO"{
            cell.imageCell.image = UIImage(named: "icon_ok")
        }else{
            cell.statusCell.textColor = UIColor.red
            cell.imageCell.image = UIImage(named: "icon_bloqueado")
        }
        return cell
    }
}

