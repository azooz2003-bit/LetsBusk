//
//  Artist.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import Foundation
import SwiftUI

class Artist: Codable {
    var name: String
    var bio: String
    var tags: [String : Bool]
    var pfp: String
    var myEvents: [String]
    
    init(name: String, bio: String, tags: [String : Bool], pfp: String, myEvents: [String]) {
        self.name = name
        self.bio = bio
        self.tags = tags
        self.pfp = pfp
        self.myEvents = myEvents
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setBio(bio: String) {
        self.bio = bio
    }
    
    func addTag(tag: String) {
        tags[tag] = true
    }
    
    // FUNCTION for image
    
    func removeTag(tag: String) {
        tags[tag] = false
    }
    
    func addEvent(event: String) { //given event uid as string
        myEvents.append(event)
    }
    
    
    
    
    
}
