//
//  ParkingDetailsViewController.swift
//  Parking Finder
//
//  Created by Trish Truong on 11/2/22.
//

import UIKit
import Parse

class ParkingDetailsViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var describeLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var detailTitle = ""
    var detailPhone = ""
    var detailLocation = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = detailTitle
        numberLabel.text = detailPhone
        // locationLabel.text = detailLocation
        
        // Do any additional setup after loading the view.
    }
    
    var favorited:Bool = false
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        // let user = PFUser.current()!
        // let query = PFQuery(className: "parkingSpot")
        // let parkingDetails = query.getObjectInBackground(withId: )
        if (favorited) {
            favoriteButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        } else {
            favoriteButton.setImage(UIImage(named:"unfavor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func favoriteParking(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            self.setFavorite(true)
            
        } else {
            self.setFavorite(false)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func didBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
