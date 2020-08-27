//
//  DetailViewController.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView?
    @IBOutlet weak var idLabel: UILabel?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var countryLabel: UILabel?
    @IBOutlet weak var latitudeLabel: UILabel?
    @IBOutlet weak var longitudeLabel: UILabel?
    
    //MARK: - Instances
    var presenter: DetailPresenterProtocol?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setDetail()
    }
    
    //MARK: - Private methods
    private func setMapPoint(lat: Double, lon: Double, title: String?) {
        let regionRadius: CLLocationDistance = 4000
        let location = CLLocation(latitude: lat, longitude: lon)
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        self.mapView?.setRegion(coordinateRegion, animated: true)
        
        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon))
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = coordinate
        self.mapView?.addAnnotation(annotation)
    }
}

//MARK: - Extensions

    //MARK: - DetailViewController
extension DetailViewController: DetailViewProtocol {
    func setDetail(item: Datum?) {
        idLabel?.text = item?.id
        nameLabel?.text = item?.name
        countryLabel?.text = item?.country
        if let lat = item?.lat, let lon = item?.lon {
            latitudeLabel?.text = String(describing: lat)
            longitudeLabel?.text = String(describing: lon)
            setMapPoint(lat: lat, lon: lon, title: item?.name)
        }
    }
}
