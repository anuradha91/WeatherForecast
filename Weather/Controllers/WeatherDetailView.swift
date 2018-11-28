//
//  WeatherDetailView.swift
//  Weather
//
//  Created by Anuradha Sharma on 11/26/18.
//  Copyright © 2018 Anuradha Sharma. All rights reserved.
//

import UIKit

class WeatherDetailView: UIViewController {
    
    //MARK:- Variables
    var detailWeather : Weather?

    //MARK:- Outlets
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblHighTemp: UILabel!
    @IBOutlet weak var lblLowTemp: UILabel!
    @IBOutlet weak var lblPrecip: UILabel!
    
    //MARK:- Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Weather"
        lblDate.text = detailWeather?.date
        lblSummary.text = detailWeather?.info
        lblHighTemp.text = detailWeather?.tempMax
        lblLowTemp.text = detailWeather?.tempMin
        lblPrecip.text = detailWeather?.precip
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
