//
//  ViewController.swift
//  Weather
//
//  Created by Baishi Wu on 10/30/16.
//  Copyright © 2016 Baishi Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentSummary: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: "https://api.forecast.io/forecast/d3250bf407f0579c8355cd39cdd4f9e1/40.7138,-73.9630") {
            if let data = NSData(contentsOf: url as URL) {
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                    print(parsed["currently"]!["summary"])
                    
                    self.currentTemp.text = "\(parsed["currently"]!["temperature"]!!)"
                    self.currentSummary.text = "\(parsed["currently"]!["summary"]!!)"
                }
                catch let error as NSError {
                    print("A JSON parsing error occurred, here are the details:\n \(error)")
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
