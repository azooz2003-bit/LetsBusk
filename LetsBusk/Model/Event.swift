//
//  Event.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import Foundation
import FirebaseFirestore
import CoreLocation

class Event: ObservableObject, Identifiable {
    var title: String
    var genreTags: [String : Bool]
    var location: CLLocationCoordinate2D // lon, lat
    var description: String
    
    init(title: String, genreTags: [String : Bool], location: CLLocationCoordinate2D, description: String) {
        self.title = title
        self.genreTags = genreTags
        self.location = location
        self.description = description
    }
}
