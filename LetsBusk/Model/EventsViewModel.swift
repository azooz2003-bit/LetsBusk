//
//  EventsViewModel.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import Foundation
import MapKit
import CoreLocation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class EventsViewModel: ObservableObject {
    @Published var userVM: UserViewModel
    @Published var locManager: LocationManager
    @Published var events: [Event] // universal events
    @Published var userEvents: [Event] = []

    @Published var currentEventData: Dictionary<String, Any>?

    
    init(userVM: UserViewModel, locManager: LocationManager, events: [Event] = []) {
        self.userVM = userVM
        self.locManager = locManager
        self.events = events
    }
    
    // fetches all the events available for users from the collection, can be seen IF user is non-artist.
    func syncEvents(completion: @escaping (Bool) -> (Void)) async {
        do {
            let snap = try await userVM.db.collection("events").getDocuments()
            snap.documents.forEach { docSnapshot in
                let data = docSnapshot.data()
                let event = Event(title: data["title"] as! String, genreTags: data["genreTags"] as! [String : Bool], location: CLLocationCoordinate2D(latitude: (data["location"] as! [String : Double])["lat"]!, longitude: (data["location"] as! [String : Double])["lon"]!), description: data["description"] as! String)
                self.appendEvent(event: event) { success in
                    completion(true)
                }
            }
        } catch {
            completion(false)
            print("bad sync events")
        }
        
    }
                                  
    func appendEvent(event: Event, completion: @escaping (Bool) -> (Void)) {
        events.append(event)
        completion(true)
    }
    
    // 1. Calls the cloud add function for collection then userVM  2. Adds it locally to the userVM's user
    func addEvent(event: Event, completion: @escaping (Bool) -> (Void)) {
        let ref = userVM.db.collection("event").document()
        print("id is" + ref.documentID)
        ref.setData(["title" : event.title, "genreTags" : event.genreTags, "location" : ["lat" : event.location.latitude, "lon" : event.location.longitude], "description": event.description]) { error in
            if let error = error {
                completion(false)
                print("Add event failed!!!" + error.localizedDescription)
            } else {
                completion(true)
                print("operation")
            }
        }
        userVM.artist!.myEvents.append(ref.documentID.description)
        events.append(event)
        userVM.addData(pfpImage: nil) { success in
            completion(success)
        }
    }
    
    func getEvent(id: String) {
        
        self.getEventConfirmation(id: id) { success, data in
            if (success) {
                self.currentEventData = data
            } else {
                self.currentEventData = nil
            }
        }
                
    }
    
    func getEventConfirmation(id: String, completion: @escaping (Bool, Dictionary<String, Any>) -> (Void)) {
        userVM.db.collection("event").document(id).getDocument { doc, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false, [:])
            } else {
                completion(true, (doc?.data())!)
            }
        }
    }
    
}
