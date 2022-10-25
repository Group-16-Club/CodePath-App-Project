//
//  ProfileViewController.swift
//  Parking Finder
//
//  Created by Trish Truong on 10/24/22.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.layer.cornerRadius=10
        editButton.layer.borderWidth=1
        editButton.layer.borderColor=CGColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
        
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        let main=UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController=main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene=UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate=windowScene.delegate as? SceneDelegate else{return}
        delegate.window?.rootViewController=loginViewController
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
