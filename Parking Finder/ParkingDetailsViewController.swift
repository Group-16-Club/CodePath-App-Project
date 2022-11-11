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
    @IBOutlet weak var hoursText: UILabel!
    @IBOutlet weak var ratesText: UITextView!
    @IBOutlet weak var isOpenLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var detailTitle = ""
    var detailDescription = ""
    var detailPhone=""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(detailTitle)
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
