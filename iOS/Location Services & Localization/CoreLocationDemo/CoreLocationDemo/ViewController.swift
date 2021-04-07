//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by TTN on 05/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mMapView: MKMapView!
    var locationManager:CLLocationManager!
    var currentLocationStr = "Current location"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        determineCurrentLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let mUserLocation:CLLocation = locations[0] as CLLocation

        let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
        let mRegion = MKCoordinateRegion(center: center, latitudinalMeters: 200, longitudinalMeters: 200)

         mMapView.setRegion(mRegion, animated: true)
        
        let circle = MKCircle(center: center, radius: 300)
        mMapView.addOverlay(circle)
        locationManager.stopUpdatingLocation()
        
       
        
        // Get user's Current Location and Drop a pin
        let mkAnnotation: MKPointAnnotation = MKPointAnnotation()
        mkAnnotation.coordinate = CLLocationCoordinate2DMake(mUserLocation.coordinate.latitude, mUserLocation.coordinate.longitude)
        mkAnnotation.title = self.setUsersClosestLocation(mLattitude: mUserLocation.coordinate.latitude, mLongitude: mUserLocation.coordinate.longitude)
        mMapView.addAnnotation(mkAnnotation)

    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error - locationManager: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }

    
    internal func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay.isKind(of: MKCircle.self){
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.fillColor = UIColor.black.withAlphaComponent(0.5)
            circleRenderer.strokeColor = UIColor.red
            circleRenderer.lineWidth = 5
            return circleRenderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }


    func determineCurrentLocation() {
    locationManager = CLLocationManager()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()

    if CLLocationManager.locationServicesEnabled() {
        locationManager.startUpdatingLocation()
    }
}

    func setUsersClosestLocation(mLattitude: CLLocationDegrees, mLongitude: CLLocationDegrees) -> String {
    let geoCoder = CLGeocoder()
    let location = CLLocation(latitude: mLattitude, longitude: mLongitude)

    geoCoder.reverseGeocodeLocation(location) {
        (placemarks, error) -> Void in

        if let mPlacemark = placemarks{
            if let dict = mPlacemark[0].addressDictionary as? [String : Any]{
                if let Name = dict["Name"] as? String{
                    if let City = dict["City"] as? String{
                        self.currentLocationStr = Name + ", " + City
                    }
                }
            }
        }
    }
    return currentLocationStr
}
}



