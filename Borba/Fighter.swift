//
//  Fighter.swift
//  Borba
//
//  Created by KTIOS2 on 12/13/18.
//  Copyright © 2018 Cim. All rights reserved.
//

import Foundation

protocol Fighter: class{        //Morali smo mu reci da je klasa inace je mislio da je kopija struktura
    var name : String  { get set }
    var surname : String { get set }
    var city : String { get set }
    var healthPoints : Int { get set }
    var isAlive : Bool { get set }
    var pictureName : String { get set }
    
    func punch(fighter: Fighter) 
    func takeSword(fighter: Fighter)
    func takeShield(fighter: Fighter)
    func totalDefence() -> Int
    func totalAttack() -> Int
}
