//
//  NewsCell.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 12/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import UIKit

//TableViewCell Class to handle the Cell of each News List. It will display the title and date of every news.
class NewsCell: UITableViewCell{
    
    //Outlets
    @IBOutlet weak var dateLabel: UILabel! //Outlet for NewsCell date label.
    @IBOutlet weak var titleLabel: UILabel! //Outlet for NewsCell title label.
    
}
