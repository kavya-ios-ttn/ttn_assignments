//
//  ViewController.swift
//  LocationServicesQ2
//
//  Created by TTN on 28/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit
import MapKit

//Global Desclarations
let IndiaCoordinate = CLLocationCoordinate2DMake(20.5937, 78.9629)// 0,0 Jaipur street coordinates


class ViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let cities = CitiesLocationList().cityName
    
    //MARK: - Map setup
    func resetRegion(){
        let region = MKCoordinateRegion(center: IndiaCoordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.setRegion(region, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
            resetRegion()
         mapView.addAnnotation(IndiaCenterCoordinate())
        mapView.addAnnotations(cities)
        
        
        
        
    }


}

class IndiaCenterCoordinate: NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D = IndiaCoordinate
    var title: String? = "0,0 Street Numbers"
    
    
}


