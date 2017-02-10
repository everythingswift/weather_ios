//
//  ViewController.swift
//  Weather
//
//  Created by SRIDHAR SANAPALA on 1/11/17.
//  Copyright © 2017 SRIDHAR SANAPALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var cityNamesArray = ["Fairbanks", "Amsterdam", "Dallas", "Adis Ababa"]
    var temperaturesArray = ["37", "57", "47", "80"]
    var timesArray = ["08:15 AM", "10:15 AM", "09:15 PM", "06:15 PM"]
    var colorsArray = [UIColor.black, UIColor.red, UIColor.blue, UIColor.gray]
    @IBOutlet weak var weatherListTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addCityTapped(_ sender: UIButton) {
    
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        let addCityVC = mainSB.instantiateViewController(withIdentifier: "ADDCITY-VC") as! AddCityViewController
        
        addCityVC.didSaveCityName = {
            (cityName:String) in
            print("received city name: " + cityName)
            self.cityNamesArray.append(cityName)
            self.temperaturesArray.append("00")
            self.timesArray.append("HH:MM a")
            self.colorsArray.append(UIColor.darkGray)
            self.weatherListTableView.reloadData()
        }
        
        self.present(addCityVC, animated: true, completion: nil)
    }
    
    //MARK:- UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cityNamesArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WEATHER_TABLE_CELL", for: indexPath)
        
        let timeLbl = cell.contentView.viewWithTag(101) as! UILabel
        timeLbl.text = timesArray[indexPath.row]

        let cityNameLbl = cell.contentView.viewWithTag(102) as! UILabel
        cityNameLbl.text = cityNamesArray[indexPath.row]
        
        let temperatureLbl = cell.contentView.viewWithTag(103) as! UILabel
        temperatureLbl.text = temperaturesArray[indexPath.row]
        
        cell.contentView.backgroundColor = colorsArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    //MARK:- UITableViewDelegate

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

