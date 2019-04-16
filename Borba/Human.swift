//
//  Human.swift
//  Borba
//
//  Created by KTIOS2 on 10/18/18.
//  Copyright © 2018 Cim. All rights reserved.
//

import Foundation

class Human {
    var name : String
    var surname : String
    var city : String
    var healthPoints : Int
    var isAlive : Bool
    var pictureName : String
    
    init(name: String, surname: String, city: String) {
        self.name = name
        self.surname = surname
        self.city = city
        self.healthPoints = 20
        self.isAlive = true
        self.pictureName = "contact"
    }
}
