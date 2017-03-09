//
//  MessageCell.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 12/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import UIKit

//TableViewCell Class to handle the Cell of each Message in List. It will display the title and date of every message.
class MessageCell: UITableViewCell{
    
    //Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
}
