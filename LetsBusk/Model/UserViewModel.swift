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
                self.getPFP { success in
                    if (success) {
                        self.assignArtistDataLocally(data: data!)
                    }
                    completion(success)
                }
                
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
        artist?.setPfp(pfp: data["pfp"] as! Data)
        artist?.myEvents = ["events"]
        
        
    }
    
    
    
    
    // WHEN SETTING NEW USER, TAKING SCHOOL FROM DROPDOWN AND EMAIL INPUT
    
    func signUp(name: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        isAuthenticating = true
        self.artist?.setName(name: name)
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            
            if result == nil || error != nil {
                //print("create error: " + error!.localizedDescription)
                self!.isAuthenticating = false
                completion(false)
                return
            } else {
                
                self?.addData(pfpImage: nil) { success in
                    print("pre add was " + success.description)
                    completion(success)
                }
                self?.isAuthenticating = false
            }
              
            
        }
    }
    
    func persistPFPStorage(image: UIImage, completion: @escaping (Bool) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let ref = storage.reference(withPath: uuid!)
        ref.putData(imageData) { metadata, error in
            if let error = error {
                completion(false)
                print("Image not uploaded! " + error.localizedDescription)
                return
            } else {
                ref.downloadURL { url, error in
                    if let error = error {
                        completion(false)
                        print("Image not uploaded! " + error.localizedDescription)
                        return
                    } else {
                        self.uploadPFPToDB(url: url!.absoluteString) { success in
                            completion(success)
                        }
                    }
                }
            }
        }
    }
    
    func uploadPFPToDB(url: String, completion: @escaping (Bool) -> Void) {
        db.collection("artists").document(uuid!).setData(["pfp" : url], merge: true) { error in
            if let error = error {
                completion(false)
                print("Image not uploaded! " + error.localizedDescription)
                return
            } else {
                completion(false)
            }
        }
    }
    
    func getPFP(completion: @escaping (Bool) -> Void) {
        let url = db.document(uuid!).getDocument { document, error in
            if let error = error {
                completion(false)
                print("Image not received! " + error.localizedDescription)
                return
            } else {
                let data = document?.data()
                let url = data!["pfp"] // POTENTIAL RACE ISSUE
                self.getPFPfromStorage(url: url as! String) { success in
                    completion(success)
                }
            }
        }
    }
    
    func getPFPfromStorage(url: String, completion: @escaping (Bool) -> Void) {
        storage.reference().child(url).getData(maxSize: 1024 * 1024) { data, error in
            if let error = error {
                completion(false)
                print("Image not received! " + error.localizedDescription)
                return
            } else {
                self.artist?.setPfp(pfp: data!)
                completion(true)
            }
        }
    }
    
    
    func addData(pfpImage: UIImage?, completion: @escaping (Bool) -> Void) {
        if !artistIsAuthenticated {
            completion(false)
        }
        
        if let pfpImage = pfpImage {
            persistPFPStorage(image: pfpImage) { success in
                
                if success {
                    self.db.collection("users").document((self.uuid)!).setData(["name" : self.artist?.name, "bio" : self.artist?.bio, "tags" : self.artist?.tags, "events" : self.artist?.myEvents]) // pfp is already set from calling sub-function
                }
                
                completion(success)

            }
        } else {
            self.db.collection("users").document((self.uuid)!).setData(["name" : self.artist?.name, "bio" : self.artist?.bio, "tags" : self.artist?.tags, "events" : self.artist?.myEvents]) // pfp is already set from calling sub-function
            completion(true)
        }
            // ENCODE PFP first!
        
            
        
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

