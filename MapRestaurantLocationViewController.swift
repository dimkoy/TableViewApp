//
//  MapRestaurantLocationViewController.swift
//  tableViewApplication
//
//  Created by Dmitriy on 23/01/2017.
//  Copyright © 2017 Dmitriy. All rights reserved.
//

import UIKit
import MapKit

class MapRestaurantLocationViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in
            if error != nil {
                print(error!)
                return
            }
            if placemarks != nil && (placemarks?.count)! > 0 {
                let placemark = placemarks![0]
                
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                annotation.coordinate = (placemark.location?.coordinate)!
                
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
                
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //создаем аннотацию
        //идентификатор
        
        
        let identifier = "CurrentPin"
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        //ищем свободные аннотации
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        //добавляем изображение к аннотации
        
        let leftSideAnnotationView = UIImageView(frame: CGRect(x: 0, y: 0, width: 52, height: 52))
        leftSideAnnotationView.image = UIImage(data: restaurant.image as Data)
        annotationView?.leftCalloutAccessoryView = leftSideAnnotationView
        
        return annotationView
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
