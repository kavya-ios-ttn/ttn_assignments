//
//  ViewController.swift
//  LocationServicesDemo
//
//  Created by TTN on 27/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    private let locationManager = CLLocationManager()
    //private var currentCoordinate = CLLocationCoordinate2D()

    let jaipurAnnotation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 26.9124, longitude: 75.7873)
    
    let dehradunAnnotation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 30.3165, longitude: 78.0322)
    
    let agraAnnotation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 27.1767, longitude: 78.0081)
    
    let aligarhAnnotation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 27.8974, longitude: 78.0880)
    
    let karnalAnnotation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 29.6857, longitude: 76.9905)
    

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cnfigureLocationServices()
        // Do any additional setup after loading the view.
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = jaipurAnnotation
        annotation1.title = "Jaipur"
        annotation1.subtitle = "This is the first location!"
        mapView.addAnnotation(annotation1)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = dehradunAnnotation
        annotation2.title = "Dehradun"
        annotation2.subtitle = "This is the second location!"
        mapView.addAnnotation(annotation2)
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = agraAnnotation
        annotation3.title = "Agra"
        annotation3.subtitle = "This is the third location!"
        mapView.addAnnotation(annotation3)
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = aligarhAnnotation
        annotation4.title = "Aligarh"
        annotation4.subtitle = "This is the fourth location!"
        mapView.addAnnotation(annotation4)
        
        let annotation5 = MKPointAnnotation()
        annotation5.coordinate = karnalAnnotation
        annotation5.title = "Karnal"
        annotation5.subtitle = "This is the fifth location!"
        mapView.addAnnotation(annotation5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func cnfigureLocationServices() {
        locationManager.delegate = self

        let status = CLLocationManager.authorizationStatus()

        if status == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else if status == .authorizedWhenInUse || status == .authorizedAlways {
            beginLocationUpdates(locationManager: locationManager)

        }
    }

    private func beginLocationUpdates(locationManager: CLLocationManager) {
        mapView.showsUserLocation = true

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {

        let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(zoomRegion, animated: true)
    }

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did get latest location")

        guard let latestLocation = locations.first else { return }

//        if currentCoordinate == nil {
//            zoomToLatestLocation(with: latestLocation.coordinate)
//            addAnnotations()
//        }
//
//        currentCoordinate = latestLocation.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("The status changed")
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            beginLocationUpdates(locationManager: manager)
        }
    }
}
