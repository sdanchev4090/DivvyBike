//
//  Station.swift
//  DivvyBike
//
//  Created by Sava Danchev on 12/22/22.
//

import Foundation

class Station {
    var name : String
    var docks : Int
    var docksInService : Int
    var status : String
    var location : CGPoint
    
    init(name: String, docks: Int, docksInService: Int, status: String, location: CGPoint) {
        self.name = name
        self.docks = docks
        self.docksInService = docksInService
        self.status = status
        self.location = location
    }
    
}
