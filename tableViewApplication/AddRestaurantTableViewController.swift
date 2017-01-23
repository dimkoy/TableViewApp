//
//  AddRestaurantTableViewController.swift
//  tableViewApplication
//
//  Created by Dmitriy on 23/01/2017.
//  Copyright © 2017 Dmitriy. All rights reserved.
//

import UIKit
import CoreData

class AddRestaurantTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var restaurant: Restaurant!
    var isVisited = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yesButton.backgroundColor = UIColor.gray
        noButton.backgroundColor = UIColor(red: 0, green: 120/255, blue: 10/255, alpha: 1.0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .savedPhotosAlbum
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.scaleToFill
        imageView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveRestaurant() {
        //проверка на заполненость полей
        var error = ""
        if (nameTextField.text?.isEmpty)! {
            error = "Название"
        } else if (typeTextField.text?.isEmpty)! {
            error = "Тип"
        } else if (locationTextField.text?.isEmpty)! {
            error = "Расположение"
        }
        if error != "" {
            let alertContoller = UIAlertController(title: "Упс", message: "Сохранение не удалось, так как поле " + error + " не заполнено", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alertContoller.addAction(okAction)
            self.present(alertContoller, animated: true, completion: nil)
            
            return
        }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
            restaurant = Restaurant(context: context)
            restaurant.image = UIImagePNGRepresentation(imageView.image!)! as NSData!
            restaurant.name = nameTextField.text
            restaurant.type = typeTextField.text
            restaurant.location = locationTextField.text
            restaurant.isVisited = isVisited as NSNumber!
            restaurant.saveContext()
          //  var error: NSError?
         //   if managedObjectContext.save(&error) {
           //     print("произошла ошибка \(error!.localizedDescription)")
          //  }
            
        
        performSegue(withIdentifier: "unwindBackToHomeScreen", sender: self)
    }

    @IBAction func isRestaurantVisited(sender: AnyObject) {
        let pressedButton = sender as! UIButton
        
        if pressedButton == yesButton {
            isVisited = true
            yesButton.backgroundColor = UIColor(red: 0, green: 120/255, blue: 10/255, alpha: 1.0)
            noButton.backgroundColor = UIColor.gray
        } else {
            isVisited = false
            yesButton.backgroundColor = UIColor.gray
            noButton.backgroundColor = UIColor(red: 0, green: 120/255, blue: 10/255, alpha: 1.0)
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
