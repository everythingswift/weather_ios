//
//  AddCityViewController.swift
//  Weather
//
//  Created by SRIDHAR SANAPALA on 2/10/17.
//  Copyright © 2017 SRIDHAR SANAPALA. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController {

    @IBOutlet weak var cityNameTextField:UITextField!
    var didSaveCityName:((String)->())!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {

        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveTapped(_ sender: UIButton) {
        
        if self.cityNameTextField.text?.characters.count == 0{
            
        }else{
            didSaveCityName(self.cityNameTextField.text!)
        }
        
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
