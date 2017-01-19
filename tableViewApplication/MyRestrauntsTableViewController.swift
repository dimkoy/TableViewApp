//
//  MyRestrauntsTableViewController.swift
//  tableViewApplication
//
//  Created by Dmitriy on 17/01/2017.
//  Copyright © 2017 Dmitriy. All rights reserved.
//

import UIKit

class MyRestrauntsTableViewController: UITableViewController {
    
    var restaurantNames = ["Ogonek Grill&Bar", "Ely", "Bonsai", "Dastarhan", "IndiaChina", "X.O", "Balkan grill", "Respublica", "Speak Easy", "Morris Pub", "Tasty stories", "Classic", "Love&Life", "Shock", "Bochka"]
    
    var restaurantImages = ["ogonek.jpg", "elu.jpg", "bonsai.jpg", "dastarhan.jpg", "indokitay.jpg", "x.o.jpg", "balkan.jpg", "respublika.jpg", "speakeasy.jpg", "morris.jpg", "istorii.jpg", "klassik.jpg", "love.jpg", "shok.jpg", "bochka.jpg"]
    var restaurantType = ["ресторан", "ресторан", "ресторан", "ресторан", "ресторан", "ресторан-клуб", "ресторан", "ресторан", "ресторанный комплекс", "ресторан", "ресторан", "ресторан", "ресторан", "ресторан", "ресторан", "ресторан", ]
    var restaurantLocation = ["Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа", "Уфа"]
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //create alert controller
        let actionMenu = UIAlertController(title: nil, message: "What to do?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        //create action for controller
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
        actionMenu.addAction(cancelAction)
        
        let callActionHandler = {(action: UIAlertAction!) -> Void in
            print("CallActionHandler is on")
            let warningMessage = UIAlertController(title: "Сервис не доступен", message: "В данный момент вызов не может быть выполнен", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            warningMessage.addAction(okAction)
            self.present(warningMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call 785765", style: .default, handler: callActionHandler)
        actionMenu.addAction(callAction)
    
        //present controller
        self.present(actionMenu, animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyRestrauntTableViewCell
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocation[indexPath.row]
        cell.typeLabel.text = restaurantType[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height/2
        cell.thumbnailImageView.clipsToBounds = true

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
