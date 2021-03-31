//
//  ViewController.swift
//  LocationServicesDemo
//
//  Created by TTN on 27/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:26.9124 , longitude: 75.7873)
    
    private let locationManager = CLLocationManager()
    //private var currentCoordinate = CLLocationCoordinate2D()

    let jaipurAnnotation = CLLocationCoordinate2D(latitude: 26.9124, longitude: 75.7873)
    
    let dehradunAnnotation = CLLocationCoordinate2D(latitude: 30.3165, longitude: 78.0322)
    
    let agraAnnotation = CLLocationCoordinate2D(latitude: 27.1767, longitude: 78.0081)
    
    let aligarhAnnotation = CLLocationCoordinate2D(latitude: 27.8974, longitude: 78.0880)
    
    let karnalAnnotation = CLLocationCoordinate2D(latitude: 29.6857, longitude: 76.9905)
    
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
        
        createPath(jaipurAnnotation: jaipurAnnotation, dehradunAnnotation: dehradunAnnotation)
        
        self.mapView.delegate = self
        
    }
    
    func createPath(jaipurAnnotation: CLLocationCoordinate2D, dehradunAnnotation: CLLocationCoordinate2D) {
        
        //Route between destinations
        
        let jaipurPlaceMark = MKPlacemark(coordinate: jaipurAnnotation, addressDictionary: nil)
        
        let dehradunPlaceMark = MKPlacemark(coordinate: dehradunAnnotation, addressDictionary: nil)
        
        let jaipurMapItem = MKMapItem(placemark: jaipurPlaceMark)
        let dehradunMapItem = MKMapItem(placemark: dehradunPlaceMark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = jaipurMapItem
        directionRequest.destination = dehradunMapItem
        directionRequest.transportType = .automobile
        
        let direction = MKDirections(request: directionRequest)
        
        direction.calculate{ (response, error) in
            guard let response = response else {
                if let error = error {
                    print("ERROR FOUND: \(error.localizedDescription)")
                }
                return
            }
            
            let route = response.routes[0]
            self.mapView.addOverlay(route.polyline, level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
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

extension ViewController: MKMapViewDelegate {
    
    internal func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolyline {
            let rendere = MKPolylineRenderer(overlay: overlay)
            rendere.lineWidth = 5
            rendere.strokeColor = .systemBlue
            return rendere
            
        }
        if overlay.isKind(of: MKCircle.self){
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.fillColor = UIColor.black.withAlphaComponent(0.5)
            circleRenderer.strokeColor = UIColor.red
            circleRenderer.lineWidth = 5
            return circleRenderer
        }
        
//        let rendere = MKPolylineRenderer(overlay: overlay)
//        rendere.lineWidth = 5
//        rendere.strokeColor = .systemBlue
//        return rendere
    return MKOverlayRenderer(overlay: overlay)
}
    
//    internal func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//            if overlay.isKind(of: MKCircle.self){
//                let circleRenderer = MKCircleRenderer(overlay: overlay)
//                circleRenderer.fillColor = UIColor.black.withAlphaComponent(0.5)
//                circleRenderer.strokeColor = UIColor.red
//                circleRenderer.lineWidth = 5
//                return circleRenderer
//            }
//            return MKOverlayRenderer(overlay: overlay)
//        }
}

extension ViewController {
  

// 1
@objc(mapView:viewForAnnotation:) func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

  if let annotation = annotation as? ViewController {

    let reuseID = "pin"

    var view: MKPinAnnotationView
    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID)
          as? MKPinAnnotationView { // 2
        dequeuedView.annotation = annotation
        view = dequeuedView
    } else {
      // 3
      view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
      view.canShowCallout = true
      view.isUserInteractionEnabled = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton.init(type: .detailDisclosure) as UIButton
    }
    return view
  }
  return nil
}

func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
  if control == view.rightCalloutAccessoryView {
    print(view.annotation?.title as Any)
    performSegue(withIdentifier: "SecondScreenViewController", sender: self)
  }

}


func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  if (segue.identifier == "SecondScreenViewController") {
    // pass data to next view
    let destViewController:SecondScreenViewController = segue.destination as! SecondScreenViewController
    destViewController.viaSegue = sender as! MKAnnotationView
  }
}

}
