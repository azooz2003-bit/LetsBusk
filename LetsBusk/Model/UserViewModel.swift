//
//  UserViewModel.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import Foundation

//
//  UserViewModel.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/14/22.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseStorage

class UserViewModel: ObservableObject {
    @Published var artist: Artist?
    
    @Published var isAuthenticating: Bool = false
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    private let storage = Storage.storage()
        
    var uuid: String? {
        auth.currentUser?.uid
    }
    var artistIsAuthenticated: Bool {
        auth.currentUser != nil
    }
    var artistIsAuthenticatedAndSynced: Bool {
        artist != nil && artistIsAuthenticated
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> (Void)) {
        isAuthenticating = true
        
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            
            if result == nil || error != nil {
                print(error?.localizedDescription)
                self?.isAuthenticating = false
                completion(false)
                return
            } else {
                self?.sync { success in
                    self?.isAuthenticating = false
                    completion(success)
                }
            }
        }
        
    }
    
    
    func sync(completion: @escaping (Bool) -> Void) {
        if !artistIsAuthenticated {
            print("pre-sync abort")
            completion(false)
            return
        }
        db.collection("artists").document(self.uuid!).getDocument { (document, error) in
            //print(document!)
            if (document == nil || error != nil) {
                print("Error pre-sync")
                completion(false)
                return
            }
            
            do {
                let data = try document!.data()
                self.assignArtistDataLocally(data: data!)
                completion(true)
            } catch {
                completion(false)
            }
        
        }
    }
    
    func assignArtistDataLocally(data: [String : Any]) {
        artist?.name = data["name"] as! String
        artist?.bio = data["bio"] as! String
        artist?.tags = data["tags"] as! [String : Bool]
        // Do some stuff with image to save as encode for pfp
        artist?.myEvents = ["events"]
        
        
    }
    
    
    
    
    // WHEN SETTING NEW USER, TAKING SCHOOL FROM DROPDOWN AND EMAIL INPUT
    
    func signUp(email: String, password: String, completion: @escaping (Bool) -> Void) {
        isAuthenticating = true
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            
            if result == nil || error != nil {
                //print("create error: " + error!.localizedDescription)
                self!.isAuthenticating = false
                completion(false)
                return
            } else {
                
                self?.addData() { success in
                    print("pre add was " + success.description)
                    completion(success)
                }
                self?.isAuthenticating = false
            }
              
            
        }
    }
    
    func addData(completion: @escaping (Bool) -> Void) {
        if !artistIsAuthenticated {
            completion(false)
        }
        do {
            // ENCODE PFP first!
            try db.collection("users").document((self.uuid)!).setData(["name" : artist?.name, "bio" : artist?.bio, "tags" : artist?.tags, "events" : artist?.myEvents])
            completion(true)
        } catch {
            completion(false)
            print("adding data error")
        }
    }
    
    
    

}
    


//func getImage() {
//    let storage = Storage.storage()
//    let gsReference = storage.reference(forURL: "gs://edusafe-ffcb0.appspot.com/YaleProfile.jpeg")
//    //
//    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
//      if let error = error {
//          print(error)
//      } else {
//        return UIImage(data: data!)
//      }
//    }
//}

