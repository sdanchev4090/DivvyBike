//
//  ViewController.swift
//  DivvyBike
//
//  Created by Sava Danchev on 12/14/22.
//

import UIKit

class ViewController: UIViewController {
    var array : [String] = []
    
    let url = URL(string: "https://data.cityofchicago.org/resource/aavc-b2wj.json")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }
    
    func getData() {
        
    }

    
    
}

