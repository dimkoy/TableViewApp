//
//  MyRestrauntsTableViewController.swift
//  tableViewApplication
//
//  Created by Dmitriy on 17/01/2017.
//  Copyright © 2017 Dmitriy. All rights reserved.
//

import UIKit

class MyRestrauntsTableViewController: UITableViewController {
    
    
    
    //создаем экземпляр класса Restaurant
    var myRestaurants: [Restaurant] = []
    
    /* var myRestaurants: [Restaurant] = [Restaurant(name: "Ogonek Grill&Bar", type: "ресторан", location: "Уфа, ул. Хадии Давлетшиной 21", image: "ogonek.jpg", isVisited: false),
         Restaurant(name: "Ely", type: "ресторан", location: "Уфа", image: "elu.jpg", isVisited: false),
         Restaurant(name: "Bonsai", type: "ресторан", location: "Уфа", image: "bonsai.jpg", isVisited: false),
         Restaurant(name: "Dastarhan", type: "ресторан", location: "Уфа", image: "dastarhan.jpg", isVisited: false),
         Restaurant(name: "IndiaChina", type: "ресторан", location: "Уфа", image: "indokitay.jpg", isVisited: false),
         Restaurant(name: "X.O", type: "ресторан-клуб", location: "Уфа", image: "x.o.jpg", isVisited: false),
         Restaurant(name: "Balkan grill", type: "ресторан", location: "Уфа", image: "balkan.jpg", isVisited: false),
         Restaurant(name: "Respublica", type: "ресторан", location: "Уфа", image: "respublika.jpg", isVisited: false),
         Restaurant(name: "Speak Easy", type: "ресторанный комплекс", location: "Уфа", image: "speakeasy.jpg", isVisited: false),
         Restaurant(name: "Morris Pub", type: "ресторан", location: "Уфа", image: "morris.jpg", isVisited: false),
         Restaurant(name: "Tasty stories", type: "ресторан", location: "Уфа", image: "istorii.jpg", isVisited: false),
         Restaurant(name: "Classic", type: "ресторан", location: "Уфа", image: "klassik.jpg", isVisited: false),
         Restaurant(name: "Love&Life", type: "ресторан", location: "Уфа", image: "love.jpg", isVisited: false),
         Restaurant(name: "Shock", type: "ресторан", location: "Уфа", image: "shok.jpg", isVisited: false),
         Restaurant(name: "Bochka", type: "ресторан", location: "Уфа", image: "bochka.jpg", isVisited: false),
                                       ]
    */


    @IBAction func unwindBackToHomeScreen(segue: UIStoryboardSegue) {
        
    }
    
/*    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //create alert controller
        let actionMenu = UIAlertController(title: nil, message: "What to do?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        //create action for controller
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
        actionMenu.addAction(cancelAction)
        
        
        //действие "я тут был"
        let iHaveBeenThereAction = UIAlertAction(title: "Я тут был", style: .default, handler: {(action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            //cell?.accessoryType = .checkmark
            cell?.accessoryView = UIImageView(image: UIImage(named: "Icon-Small.png"))
            self.restaurantAlreadyVisited[indexPath.row] = true
        })
        
        //действие "я тут не был"
        let iHaveNeverBeenThereAction = UIAlertAction(title: "Я тут не был", style: .default, handler: {(action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            //cell?.accessoryType = .none
            cell?.accessoryView = nil
            self.restaurantAlreadyVisited[indexPath.row] = false
        })
       
        //создаем ячейку, проверем наличие .checkmark и добавляем соответсвующее действие
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryView == nil {
                actionMenu.addAction(iHaveBeenThereAction)
        } else {
                actionMenu.addAction(iHaveNeverBeenThereAction)
        }
       /* if cell?.accessoryType == .checkmark {
             actionMenu.addAction(iHaveNeverBeenThereAction)
        } else {
             actionMenu.addAction(iHaveBeenThereAction)
        }*/
        
        
        //обработчик звонка
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
        
        tableView.deselectRow(at: indexPath, animated: true)
        
       
        
    }
 */
//добавим действие удаления ячейки
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //создаем кнопку share
        let allShareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Поделится") {
            (UITableViewRowAction, indexPath: IndexPath!) -> Void in
            let allShareActionMenu = UIAlertController(title: nil, message: "Поделиться через", preferredStyle: .actionSheet)
            
            let emailShareAction = UIAlertAction(title: "Email", style: .default, handler: nil)
            let facebookShareAction = UIAlertAction(title: "Facebook", style: .default, handler: nil)
            let vkShareAction = UIAlertAction(title: "VK", style: .default, handler: nil)
            let cancelShareAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            
            allShareActionMenu.addAction(emailShareAction)
            allShareActionMenu.addAction(facebookShareAction)
            allShareActionMenu.addAction(vkShareAction)
            allShareActionMenu.addAction(cancelShareAction)
            
            self.present(allShareActionMenu, animated: true, completion: nil)
            
        }
        
        //создаем кнопку delete
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "удалить") {
            (UITableViewRowAction, indexPath: IndexPath!) -> Void in
            
            self.myRestaurants.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        allShareAction.backgroundColor = UIColor(red: 184/255, green: 226/255, blue: 181/255, alpha:  1.0)
        deleteAction.backgroundColor = UIColor.red
            
        return [deleteAction, allShareAction]
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.hidesBarsOnSwipe = true
        
        self.tableView.estimatedRowHeight = 85
        self.tableView.rowHeight = UITableViewAutomaticDimension
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
        return myRestaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyRestrauntTableViewCell
        
        cell.nameLabel.text = myRestaurants[indexPath.row].name
        cell.locationLabel.text = myRestaurants[indexPath.row].location
        cell.typeLabel.text = myRestaurants[indexPath.row].type
        cell.thumbnailImageView.image = UIImage(data: myRestaurants[indexPath.row].image as Data)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height/2
        cell.thumbnailImageView.clipsToBounds = true
        cell.checkImageView.isHidden = !myRestaurants[indexPath.row].isVisited.boolValue
        
     // cell.accessoryType = restaurantAlreadyVisited[indexPath.row] ? .checkmark : .none
     // cell.tintColor = UIColor.red
      //  cell.accessoryView = UIImageView(image: UIImage(named: "Icon-Small.png"))
      //  cell.accessoryView = restaurantAlreadyVisited[indexPath.row] ? UIImageView(image: UIImage(named: "Icon-Small.png")) : nil
    
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetailsSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! DetailsViewController
                destinationVC.restaurant = self.myRestaurants[indexPath.row]
            }
        }
        
     }
    

}
