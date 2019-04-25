//
//  LocationServices.swift
//  TripStop
//
//  Created by Medi Assumani on 4/21/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import CoreLocation
import Foundation
import MapKit

struct LocationServices{
    
    static let shared = LocationServices()
    
    /** Return the coordinate of a location based on its address
     @param -> address : the string formated address of a single location
     @return ->CLLocationCoordinate2D?: the coordinate obejct with latitude and longitude properties.
    **/
    func addressToCoordinate(_ address: String, completion: @escaping(CLLocationCoordinate2D?) ->()){
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            placemarks, error in
            
            if error != nil {return completion(nil)}
            
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            guard let longitude = lon, let latitutde = lat else {return completion(nil)}
            
            return completion(CLLocationCoordinate2D(latitude: latitutde, longitude: longitude))
        }
        
    }
    
    
    /** Centers a given location on the map
     @param -> coordinates : The longitude and latitude of a location
     @param -> annotationTitle : The name of the location (e.g: walmart, home depot)
     @param -> map : the mapview instance to cenyter the location on
    **/
    func centerLocationOnMap(coordinates: CLLocationCoordinate2D, annotationTitle: String, map: MKMapView){
        
        let regionRadius = 1000.0
        let region = MKCoordinateRegion(center: coordinates,
                                        latitudinalMeters: regionRadius,
                                        longitudinalMeters: regionRadius)
        map.setRegion(region, animated: true)
        
        let targetLocationAnnotation = MKPointAnnotation()
        targetLocationAnnotation.title = "\(annotationTitle)"
        targetLocationAnnotation.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
        map.addAnnotation(targetLocationAnnotation)
    }
    
    
    /** Converts a placemark to a custom readable address format like: "555 Post Street, San Francisco, CA"
     @param ->  selectedItem : the placemark object that contains a location's information
     @return ->  addressLine : a string format of the address
     **/
    func parseAddress(selectedItem: MKPlacemark) -> String {
        
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
        
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        let addressLine = String(format:"%@%@%@%@%@%@%@", selectedItem.subThoroughfare ?? "", firstSpace, selectedItem.thoroughfare ?? "",
                                 comma,
                                 selectedItem.locality ?? "",
                                 secondSpace,
                                 selectedItem.administrativeArea ?? "")
        return addressLine
    }
}
