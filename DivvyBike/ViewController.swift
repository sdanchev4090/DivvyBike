//
//  ViewController.swift
//  DivvyBike
//
//  Created by Sava Danchev on 12/14/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var array : [Station] = []
    
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
            
            if let json = try? JSONSerialization.jsonObject(with: data) as? [NSDictionary] {
                self.array.removeAll()
                print(json)
                
                for element in json {
                    let name = element.object(forKey: "station_name") as! String
                    let docks = Int(element.object(forKey: "total_docks") as! String)
                    let docksInService = Int(element.object(forKey: "docks_in_service") as! String)
                    let status = element.object(forKey: "status") as! String
                    
                    let latitude = Float(element.object(forKey: "latitude") as! String)
                    let longitude = Float(element.object(forKey: "longitude") as! String)
                    let location = CGPoint(x: 0, y: 0)
                    
                    self.array.append(Station(name: name, docks: docks!, docksInService: docksInService!, status: status, location: location))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.navigationItem.title = "Chicago - DivvyBike"
                }
            }
            
        }.resume()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = array[indexPath.row].name
        content.secondaryText = array[indexPath.row].status
        cell.contentConfiguration = content
        return cell
    }
    
    
    
}

