//
//  ViewController.swift
//  DivvyBike
//
//  Created by Sava Danchev on 12/14/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var array : [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    let url = URL(string: "https://data.cityofchicago.org/resource/aavc-b2wj.json")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    func getData() {
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data else { return }
            
            if let json = try? JSONSerialization.jsonObject(with: data) as? NSDictionary {
                
            }
            
        }.resume()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = array[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    
}

