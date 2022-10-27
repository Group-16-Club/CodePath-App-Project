//
//  EditProfileViewController.swift
//  Parking Finder
//
//  Created by rodeo station on 10/25/22.
//

import UIKit
import Parse
import AlamofireImage

class EditProfileViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var pictureView: UIImageView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPicture(PFUser.current()!)
        
    }
    @IBAction func onTap(_ sender: Any) {
        
        let picker=UIImagePickerController()
        picker.delegate=self
        picker.allowsEditing=true
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else{
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true,completion:nil)
    }
   
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onSave(_ sender: Any) {
        let user=PFUser.current()!
        let imageData=pictureView.image!.pngData()
        let file = PFFileObject(name: "profilePicture.png", data: imageData!)
        user["profileImage"]=file
        user.saveInBackground{(success,error) in
            if success{
                self.dismiss(animated: true, completion: nil)
            }else{
                print("error!")
            }
        }
    }
    
    func getPicture(_ user:PFUser){
        if (user["profileImage"] != nil){
            let imageFile=user["profileImage"] as! PFFileObject
            let urlString=imageFile.url!
            let url=URL(string: urlString)!
            pictureView.af.setImage(withURL: url)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image=info[.editedImage] as! UIImage
        let size=CGSize(width:360,height:360)
        let scaledImage=image.af.imageAspectScaled(toFill:size)
        pictureView.image=scaledImage
        dismiss(animated: true, completion:nil)
    }
    
    
}
