//
//  ParkingDetailsViewController.swift
//  Parking Finder
//
//  Created by Trish Truong on 11/2/22.
//

import UIKit

class ParkingDetailsViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hoursText: UILabel!
    @IBOutlet weak var ratesText: UITextView!
    @IBOutlet weak var isOpenLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
