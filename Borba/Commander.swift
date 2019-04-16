//
//  Commander.swift
//  Borba
//
//  Created by KTIOS2 on 11/1/18.
//  Copyright © 2018 Cim. All rights reserved.
//

import Foundation

class Commander: Knight{
    
    var shield : Shield?
    
    init(name: String, surname: String, city: String, sword :Sword?, shield: Shield?){  //ne treba override jer smo dodali sword pa nije ista init kao humana. Moramo sve popuniti da se kompajler ne bi bunio
        super.init(name: name, surname: surname, city: city,sword: sword) // Redoslijed pozivanja: sve iz humana + attack i defence iz soldiera + sword //Moramo imati isto sto ima humman
        self.shield = shield
        self.attack = 2
        self.defence = 1
        self.pictureName = "commander"
    }
    
    /*override func totalAttack() -> Int{     //Posto nasljedjuje viteza, ne moramo da definisemo novu metodu (koja je identicna)
        if let unwrappedSword = sword{
            return self.attack + Int(arc4random_uniform(4)) + unwrappedSword.attack
        } else{
            return self.attack + Int(arc4random_uniform(4))        
        }
    }*/
    
    override func totalDefence() -> Int{
        if let unwrappedShield = shield{
            return self.defence + unwrappedShield.defence
        } else{
            return self.defence
        }
    }
    
    override func takeShield(fighter: Fighter) {
        if(self.shield == nil){
            if let fighter = fighter as? Commander{
                if var unwrappedShield = fighter.shield{
                    if(unwrappedShield.counter > 0){
                        print("Winner takes loser's shield")
                        self.shield = unwrappedShield
                        fighter.shield =  nil
                }
              }
            }
        }
    }



/*class Goblin: Fighter{        //sam je izbacio sve
    var name: String
    
    var surname: String
    
    var city: String
    
    var healthPoints: Int
    
    var isAlive: Bool
    
    var pictureName: String
    
    func punch(fighter: Fighter) {
        <#code#>
    }
    
    func takeSword(fighter: Fighter) {
        <#code#>
    }
    
    func takeShield(fighter: Fighter) {
        <#code#>
    }
    
    func totalDefence() -> Int {
        <#code#>
    }
    
    func totalAttack() -> Int {
        <#code#>
    }
}*/
    
}
