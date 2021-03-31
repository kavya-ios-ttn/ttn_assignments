//
//  CitiesLocation.swift
//  LocationServicesQ2
//
//  Created by TTN on 29/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit
import MapKit

class CitiesLocation: NSObject, MKAnnotation{
        var identifier = "City location"
        var title: String?
        var coordinate: CLLocationCoordinate2D
        init(name:String,lat:CLLocationDegrees,long:CLLocationDegrees){
            title = name
            coordinate = CLLocationCoordinate2DMake(lat, long)
    }
}

    class CitiesLocationList: NSObject {
        var cityName = [CitiesLocation]()
        override init(){
            cityName += [CitiesLocation(name:"New Delhi",lat: 28.6139,long: 77.2090)]
            cityName += [CitiesLocation(name:"Mumbai",lat: 19.0760,long: 72.8777)]
            cityName += [CitiesLocation(name:"Jaipur",lat: 26.9124,long: 75.7873)]
            cityName += [CitiesLocation(name:"Chandigarh",lat: 30.7333,long: 76.7794)]
            cityName += [CitiesLocation(name:"Pune",lat: 18.5204,long: 73.8567)]
            
        }
    }

