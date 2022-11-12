//
//  Event.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import Foundation
import FirebaseFirestore

class Event: ObservableObject, Codable {
    var title: String
    var genreTags: [String : Bool]
    var time: Date
    var location: [String : Double]
    
    init(title: String, genreTags: [String : Bool], time: Date, location: [String : Double]) {
        self.title = title
        self.genreTags = genreTags
        self.time = time
        self.location = location
    }
}
