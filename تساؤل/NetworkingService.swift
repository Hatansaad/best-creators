//
//  NetworkingService.swift
//  تساؤل
//
//  Created by Bashayer on 28/06/1439 AH.
//  Copyright © 1439 Tsaul developers. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

struct Networkingservice {
    let databaseRef = Database.database().reference()
    let storageRef = Storage.storage().reference()
    
    private func saveInfo(user: User!, Fname: String,Lname: String, password: String, bio: String){
        
        //Create our user dictaonary info\
        let userInfo = ["email": user.email!, "Fname": Fname, "Lname": Lname, "password": password,  "bio": bio, "photoURL": String(describing: user.photoURL!)]
        
        //create user reference
        let userRef = databaseRef.child("users").child (user.email!)
        
        //Save the user info in the Datatese
        userRef.setValue(userInfo)
        
    }


func signIn (email: String, password: String){
    Auth.auth().signIn( withEmail: email, password: password, completion: {
        (user, error) in
        if error == nil {
            if let user = user {
                print("\(user.displayName!) hes signed in succesfully !") }
        }
        else { print (error!.localizedDescription) } } ) }


private func setUserInfo(user: User!, Fname: String,Lname: String, password: String, bio: String, data: NSData!){
    
    //Create Path for the user
    let imagePath = "profileImage\(user.email)/userPic.jpg"
    
    // Create image Reference
    let imageRef = storageRef.child(imagePath)
    
    //Create Metadata for the image
    let metaData = StorageMetadata()
    metaData.contentType = "image/jpeg"
    
    //save the user Image in the firebase storage fila
    imageRef.putData(data as Data, metadata: metaData) { (metaData, error) in
        if error == nil {
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = Fname
            changeRequest.photoURL = metaData!.downloadURL(); changeRequest.commitChanges( completion: { (error) in
                if error == nil {
                    self.saveInfo(user: user, Fname: Fname, Lname: Lname, password: password, bio:bio) }
                    
                else { print (error!.localizedDescription) }}) }
            
        else {
            
            print (error!.localizedDescription) } } }
    
    func signUp(user: User!, Fname: String, Lname:String, password: String, bio:String, data: NSData!){
        Auth.auth().createUser(withEmail: user.email!, password: password, completion: { (user, error) in
            if error == nil {
                self.setUserInfo(user: user, Fname: Fname, Lname: Lname, password: password, bio:bio, data: data)
            }
            else{
                print (error!.localizedDescription) } }  )}


}//struct
