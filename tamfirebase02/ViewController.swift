//
//  ViewController.swift
//  tamfirebase02
//
//  Created by mac on 2/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Foundation
import Firebase



class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var txt: UITextField!
     @IBOutlet weak var imgAvatar: UIImageView!

    
    //var ref:FIRDatabaseReference?
    var ref: DatabaseReference!
    var imgData:Data!
   
    @IBAction func bt_tap_avatar(_ sender: Any) {
        let alert:UIAlertController = UIAlertController(title: "Thong Bao", message: "Chon", preferredStyle: .alert)
        
        let btnPhoto:UIAlertAction = UIAlertAction(title: "PhoTo", style: .default) { (UIAlertAction) in
            
        }
        
        let btnCamera:UIAlertAction = UIAlertAction(title: "Camera", style: .default) { (UIAlertAction) in
            
        }
        
        alert.addAction(btnPhoto)
        alert.addAction(btnCamera)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tap_avatar(_ sender: UITapGestureRecognizer) {
        let alert:UIAlertController = UIAlertController(title: "Thong Bao", message: "Chon", preferredStyle: .alert)
        
        let btnPhoto:UIAlertAction = UIAlertAction(title: "PhoTo", style: .default) { (UIAlertAction) in
            
            let imgPicker = UIImagePickerController()
            imgPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imgPicker.delegate = self
            imgPicker.allowsEditing = false
            self.present(imgPicker, animated: true, completion: nil)
            
        }
        
        let btnCamera:UIAlertAction = UIAlertAction(title: "Camera", style: .default) { (UIAlertAction) in
            
        }
        
        alert.addAction(btnPhoto)
        alert.addAction(btnCamera)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func bt(_ sender: Any) {
        addArtist()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("artists");
    }

    func addArtist(){
        let key = ref.childByAutoId().key
        
        let artist = ["id":key,
            "txtname": txt.text! as String
        ]
        ref.child(key!).setValue(artist)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // xu ly chup anh
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // chon tam hinh
        let chooseImg = info[UIImagePickerControllerOriginalImage] as! UIImage
        // giam do phan giai cu atam hinh
        let imgvalue = max(chooseImg.size.width,chooseImg.size.height)
        if(imgvalue > 3000)
        {
            // cho giam do phan giai nho nhat
            imgData = UIImageJPEGRepresentation(chooseImg, 0.1)!
        }
        else if(imgvalue > 3000)
        {
            imgData = UIImageJPEGRepresentation(chooseImg, 0.3)!
        }
        else
        {
            // chuyen ve data thoi
            imgData = UIImagePNGRepresentation(chooseImg)!
        }
        
        imgAvatar.image = UIImage(data:imgData)
        // sau khi chon thi hop thoai can dong di
        dismiss(animated: true, completion: nil)
    }

}


