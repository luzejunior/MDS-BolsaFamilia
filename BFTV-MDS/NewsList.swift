//
//  NewsList.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 12/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import UIKit

//TableView Controller to handle the News List
class NewsList: UITableViewController{
    
    //#############################################################################
    //----------------- Screen State Functions -----------------\\
    //#############################################################################
    
    //This function will be called before Screen load.
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    //This function is called when the Screen load
    //It sets the title of View to "Noticias" in main Navigation Bar
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Noticias" //Set Navigation Bar title to "Noticias"
    }
    
    //#############################################################################
    //----------------- TableView State Functions -----------------\\
    //#############################################################################
    
    //This Method sets the number of sections in Table View List
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //Set the number of sections to 1
    }
    
    //This Method sets the number of elements in Table View List
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UtilVariables.noticias.count //Set the number of elementes equal to number of news in UtilVariables class.
    }
    
    //This Method set the title and date of every cell of the Table View List
    //In this particular case, it uses the UtilVariable Class which handles all titles and dates from all news.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell //Find NewsCell from Table View in Main Storyboard as NewsCell class.
        cell.dateLabel.text = UtilVariables.noticias[indexPath.row].getData() //Set the date from index to the date index in UtilVariables.data class.
        cell.titleLabel.text = UtilVariables.noticias[indexPath.row].getTitle() //Set the title from index to the title index in UtilVariables.news class.
        return cell //Return the NewsCell which will be displayed.
    }
    
    //#############################################################################
    //----------------- Segue Functions -----------------\\
    //#############################################################################
    
    //Function for prepare variables and texts for the next screen.
    //Segue is the transition for the next screen.
    //In this case it will send the selected row index to the post screen.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsPostSegue"{ //If transition to the next screen equals to "NewsPostSegue", or if the next screen is the post screen.
            let destination = segue.destination as? NewsPost //Instatiate the destination class.
            destination?.selectedRowIndex = (tableView.indexPathForSelectedRow?.row)! //Set the NewsPost class selectedRowIndex variable to Index of Selected Row in this Table View.
            //When the NewsPost Screen loads, it will see the selectedRowIndex variable as this Table View Selected index row.
        }
    }
}
