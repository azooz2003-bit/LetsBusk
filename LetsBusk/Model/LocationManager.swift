//
//  LocationManager.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    //@Published var mapView: MKMapView = .init()
    @Published var region = MKCoordinateRegion()
    @Published var manager: CLLocationManager = .init()
    @Published var errorHasOccurred = false
    
    //@Published var userLocation: CLLocation?
    
    //@Published var pickedLocation: CLLocation?
    //@Published var pickedPlaceMark: CLPlacemark?

    
    override init() {
        super.init()
        manager.delegate = self // we are now delegated to receive events from the manager
        manager.desiredAccuracy = kCLLocationAccuracyBest // best location accuracy
        manager.requestWhenInUseAuthorization() // ask user to use their location
        //mapView.delegate = self // we are now delegated to receive events from the mapView
        manager.startUpdatingLocation() // can be used to start tracking user's location
        
        
    }
    
    func locationManager(_ manager : CLLocationManager, didFailWithError error : Error) {
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /*
        guard let currentLocations = locations.last else { return } // check if not nil then assign
        self.userLocation = currentLocations //setting the user's location to the given current loc.*/
        locations.last.map {
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            // We can access the coordinates of the user's last location and assign it to the MKCoordinateRegion's field.
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways: manager.requestLocation()
        case .authorizedWhenInUse: manager.requestLocation()
        case .denied: handleLocationError()
        case .notDetermined: manager.requestWhenInUseAuthorization()
        default: ()
        }
    }
    
    func handleLocationError() {
        //error handling
        errorHasOccurred = true
    }
    
    /*
    func addDraggablePin(coordinate: CLLocationCoordinate2D) { // lat, lon of a location
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "An event is taking place here."
        mapView.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "EVENTPIN")
        marker.isDraggable = true
        marker.canShowCallout = false
        
        return marker
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        print("Updated/dragged")
        
        guard let newLocation = view.annotation?.coordinate else { return }
        
        self.pickedLocation = .init(latitude: newLocation.latitude, longitude: newLocation.longitude)
        updatePlacemark(location: .init(latitude: newLocation.latitude, longitude: newLocation.latitude))
    }
    
    func reverseLocationCoordinates(location: CLLocation) async throws -> CLPlacemark? { //USE FOR DESCRIPTION
        let place = try await CLGeocoder().reverseGeocodeLocation(location).first
        return place
    }
    
    func updatePlacemark(location: CLLocation) {
        Task {
            do {
                guard let place = try await reverseLocationCoordinates(location: location) else { return }
                await MainActor.run(body: {
                    self.pickedPlaceMark = place
                })
            } catch {
                //HANDLE ERROR
            }
        }
    }*/
}
                
    


    

