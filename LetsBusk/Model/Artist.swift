//
//  Artist.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import Foundation
import SwiftUI

class Artist: ObservableObject {
    var name: String
    var bio: String
    @Published var tags: [String : Bool]
    var pfp: Data
    @Published var myEvents: [String]
    
    init(name: String = "", bio: String = "", tags: [String : Bool] = [:], pfp: Data = Data(), myEvents: [String] = []) {
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
    
    func setTags(tags: [String : Bool]) {
        self.tags = tags
    }
    
    func addTag(tag: String) {
        tags[tag] = true
    }
    
    func toggleTag(tag: String) {
        tags[tag]!.toggle()
    }
    // FUNCTION for image
    
    func removeTag(tag: String) {
        tags[tag] = false
    }
    
    func addEvent(event: String) { //given event uid as string
        myEvents.append(event)
    }
    
    func setPfp(pfp: Data) {
        self.pfp = pfp
    }
    
    func getPFPforUI() -> Data {
        return pfp //UIImage(pfp)
    }
    
    
    
    
    
}
