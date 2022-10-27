//
//  ProfileViewController.swift
//  Parking Finder
//
//  Created by Trish Truong on 10/24/22.
//

import UIKit
import Parse

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    var numberOfSaved:Int!
    var savedArray = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.layer.cornerRadius=10
        editButton.layer.borderWidth=1
        editButton.layer.borderColor=CGColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
        pictureView.layer.cornerRadius=pictureView.frame.size.width/2
        pictureView.layer.masksToBounds=true
        tableView.delegate=self
        tableView.dataSource=self
        getUserinfo()
        loadSaved()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPicture(PFUser.current()!)
    }
    
    func getUserinfo(){
        let user=PFUser.current()!
        usernameLabel.text=user.username
        getPicture(user)
   
    }
    func getPicture(_ user:PFUser){
        if (user["profileImage"] != nil){
            let imageFile=user["profileImage"] as! PFFileObject
            let urlString=imageFile.url!
            let url=URL(string: urlString)!
            pictureView.af.setImage(withURL: url)
        }
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        let main=UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController=main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene=UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate=windowScene.delegate as? SceneDelegate else{return}
        delegate.window?.rootViewController=loginViewController
    }
    

    //table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "SavedParkingCell") as! SavedParkingCell
        let savedParking=savedArray[indexPath.row]
        cell.locationLabel.text=(savedParking["location"] as! String) ?? "Test"
        
        return cell
    }
    
    func loadSaved(){
        numberOfSaved=5
        let user=PFUser.current()!
        savedArray=(user["savedParking"] as? [PFObject]) ?? []
        tableView.reloadData()
    }

}
