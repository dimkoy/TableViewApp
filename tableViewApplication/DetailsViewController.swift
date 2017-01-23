//
//  DetailsViewController.swift
//  tableViewApplication
//
//  Created by Dmitriy on 21/01/2017.
//  Copyright © 2017 Dmitriy. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBAction func close(segue: UIStoryboardSegue) {
        
    }
    
    var restaurant: Restaurant!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.restaurantImageView.image = UIImage(data: restaurant.image as Data)
        self.tableView.backgroundColor = UIColor(red: 250/255, green: 212/255, blue: 255/255, alpha: 1.0)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 248/255, green: 182/255, blue: 255/255, alpha: 1.0)
        title = restaurant.name
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailsTableViewCell
        
        //отображение информации в ячейках 
        if indexPath.row == 0 {
            cell.keyLabel.text = "Название"
            cell.valueLabel.text = restaurant.name
            
        }
        if indexPath.row == 1 {
            cell.keyLabel.text = "Тип"
            
        }
        
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Название"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.keyLabel.text = "Тип"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.keyLabel.text = "Расположение"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.keyLabel.text = "Был(а) там"
            cell.valueLabel.text = restaurant.isVisited.boolValue ? "Да": "Нет"
        default:
            cell.keyLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            self.performSegue(withIdentifier: "showTheMap", sender: nil)        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTheMap" {
            let destinationVC = segue.destination as! MapRestaurantLocationViewController
            destinationVC.restaurant = restaurant
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
