//
//  ViewController.swift
//  MapKitDemo
//
//  Created by TTN on 25/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    fileprivate let locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
         return locationManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            self.setUpMapView()
        }
    
    func setUpMapView() {
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.delegate = self
        mapView.isZoomEnabled = true
        mapView.mapType = .standard
        self.getUsercurrentLocation()
    }
    
    func getUsercurrentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 11.0, *) {
            locationManager.showsBackgroundLocationIndicator = true
        }
        locationManager.startUpdatingLocation()
    }
    
    func addAnnotationsOnMapView(cordinates: CLLocationCoordinate2D) {
        let london = MKPointAnnotation()
        london.title = "Annotation Title"
        london.subtitle = "Sub Annotation Title"
        london.coordinate = cordinates
        mapView.addAnnotation(london)
    }
}
    extension ViewController: CLLocationManagerDelegate {
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let location = locations.last! as CLLocation
            let currentLocation = location.coordinate
            self.addAnnotationsOnMapView(cordinates: currentLocation)
            //self.geocode(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
            
            let coordinateRegion = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 800, longitudinalMeters: 800)
            mapView.setRegion(coordinateRegion, animated: true)

            let circle = MKCircle(center: currentLocation, radius: 300)
            mapView.addOverlay(circle)
            locationManager.stopUpdatingLocation()
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error.localizedDescription)
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            print(status)
        }
    }

    extension ViewController: MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard annotation is MKPointAnnotation else { return nil }
            let identifier = "Annotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                let btn = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = btn
            } else {
                annotationView!.annotation = annotation
            }
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
            if let annotation = views.first(where: { $0.reuseIdentifier == "Annotation" })?.annotation {
                mapView.selectAnnotation(annotation, animated: true)
            }
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
            print("")
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if overlay.isKind(of: MKCircle.self){
                let circleRenderer = MKCircleRenderer(overlay: overlay)
                circleRenderer.fillColor = UIColor.black.withAlphaComponent(0.5)
                circleRenderer.strokeColor = UIColor.red
                circleRenderer.lineWidth = 5
                return circleRenderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }



//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.delegate = self
//
//        manager.startUpdatingLocation()
//}

//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//
//            manager.stopUpdatingLocation()
//
//            render(location)
//
//        }
//    }
//
//        func render(_ location: CLLocation) {
//
//
//            let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//
//            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//
//            let region = MKCoordinateRegion(center: coordinate, span: span)
//            mapView.setRegion(region, animated: true)
//
//            let pin = MKPointAnnotation()
//            pin.coordinate = coordinate
//            mapView.addAnnotation(pin)
//        }
//}



    
//    func setupLocationManager() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    }
//
//    func checkLocationServices() {
//        if CLLocationManager.locationServicesEnabled() {
//            //setup our location manager
//            setupLocationManager()
//            checkLocationAuthorization()
//    }else {
//            //show alert letting the user know they have to turn this on
//
//    }
//  }
//
//    func checkLocationAuthorization() {
//        switch CLLocationManager.authorizationStatus() {
//        case .authorizedWhenInUse: //when your app is open, only then app gets location
//            //Do Map Stuff
//            //mapView.showsUserLocation = true
//            break
//        case .denied: //not allowed
//            //Show alert and instruct them to give permission
//            break
//        case .notDetermined: //request for permission
//            locationManager.requestWhenInUseAuthorization()
//            break
//        case .restricted:
//            //Show alert and let them know what's up
//            break
//        case .authorizedAlways: //app gets location even in the background
//            break
//        }
//    }
//}
//
//
//extension ViewController: CLLocationManagerDelegate {
//    func locationManager( _ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//    }
//
//    func locationManager( _ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//
//    }
//}

