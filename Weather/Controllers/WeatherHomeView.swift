//
//  WeatherHomeView.swift
//  Weather
//
//  Created by Anuradha Sharma on 11/26/18.
//  Copyright © 2018 Anuradha Sharma. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherHomeView: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    //MARK:- Variables
    var weatherArray = [Weather]()
    let locManager = CLLocationManager()
    var selectedIndex = IndexPath()
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeatherData()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Fetch Weather Data
    func fetchWeatherData(){
        locManager.delegate = self
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
    }
    
    //MARK:- CLLocation Delegates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        var currentLocation: CLLocation!
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            currentLocation = locManager.location
        }
        
        let lat = Float(currentLocation.coordinate.longitude)
        let long = Float(currentLocation.coordinate.latitude)
        
        Weather.fetchWeatherData(lat: lat,long: long, completion: {(responseArray: [Weather]) -> Void in
            self.weatherArray = responseArray
            self.tableView.reloadData()
        })
    }
    
    
    //MARK:- Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherInfoCell", for: indexPath) as! WeatherInfoCell
        cell.lblDate.text = weatherArray[indexPath.row].date
        cell.lblSummary.text = weatherArray[indexPath.row].info
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destination = segue.destination as! WeatherDetailView
            destination.detailWeather = weatherArray[selectedIndex.row]
        }
    }
    

}
