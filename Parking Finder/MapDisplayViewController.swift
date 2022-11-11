//
//  MapDisplayViewController.swift
//  Parking Finder
//
//  Created by Trish Truong on 10/24/22.
//

import UIKit
import MapKit
import CoreLocation

class MapDisplayViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var mapView: MKMapView!
    var locationManager : CLLocationManager!
    var longitude:Double!
    var latitude:Double!
    var token:String!
    var parkingLots:[[String:Any]]!
    var selectedAnnotation: MKPointAnnotation?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 200
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        getParkingSpots()
        
        // Get current longitude and latitude
        /*
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways) {
                 currentLoc = locationManager.location
            latitude=currentLoc.coordinate.latitude
            longitude=currentLoc.coordinate.longitude
        }*/
        /*
        // Make API call
        let url = URL(string: "https://api.parkme.com/lots?accesstoken=\(token)&point=\(latitude)|\(longitude)&radius=75&locale=en-US")!

        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.parkingLots=dataDictionary["results"] as! [[String:Any]]
            }
        }
        task.resume()
    */
    }

    func getParkingSpots() {
        var region = MKCoordinateRegion()
        region.center = CLLocationCoordinate2D(latitude: 40.7812, longitude:-73.9665)
        let request = MKLocalPointsOfInterestRequest(center: region.center, radius: 10000.0)
        request.pointOfInterestFilter = MKPointOfInterestFilter(including: [.parking])
            let search = MKLocalSearch(request: request)
            search.start { (response , error ) in
                guard let response = response else {
                    return
                }
            for item in response.mapItems {
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                annotation.subtitle = item.phoneNumber
                
                self.mapView.addAnnotation(annotation)
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let default_location = CLLocationCoordinate2D(latitude: 40.7812, longitude:-73.9665)
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region = MKCoordinateRegion(center: default_location , span: span)
            mapView.setRegion(region, animated: false)
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: default_location.latitude, longitude: default_location.longitude)
            
            mapView.addAnnotation(annotation)
        }
        
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            if let title = annotation.title! {
                print("Tapped \(title) pin")
                self.selectedAnnotation=view.annotation as? MKPointAnnotation
                performSegue(withIdentifier: "ParkingDetails", sender: self)
                
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ParkingDetails"{
            let destVC=segue.destination as! ParkingDetailsViewController
            destVC.detailTitle=selectedAnnotation?.title ?? ""
            destVC.detailPhone=selectedAnnotation?.subtitle ?? ""
            //destVC.detailDescription=selectedAnnotation?.description ?? ""
            
        }
    }

    // app id: sk646zkhc2
    // app key: OyJGs95epm5nFQdcjUYaD54Gl3XAB9Tx2FduPzwH
    // hash token: c2s2NDZ6a2hjMnxPeUpHczk1ZXBtNW5GUWRjalVZYUQ1NEdsM1hBQjlUeDJGZHVQendI
    // expiration date: 2022-11-24T23:23:34.5Z
    
    

}
