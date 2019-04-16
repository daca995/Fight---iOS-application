//
//  Knight.swift
//  Borba
//
//  Created by KTIOS2 on 11/1/18.
//  Copyright © 2018 Cim. All rights reserved.
//

import Foundation

class Knight: Soldier {
    
    var sword : Sword? // = Sword.init() //instanca klase mac, opcioni
    init(name: String, surname: String, city: String, sword :Sword?){  //ne treba override jer smo dodali sword pa nije ista init kao humana. Moramo sve popuniti da se kompajler ne bi bunio
        super.init(name: name, surname: surname, city: city) // Redoslijed pozivanja: sve iz humana + attack i defence iz soldiera + sword //Moramo imati isto sto ima humman
        self.sword = sword
        self.attack = 2
        self.defence = 1
        self.pictureName = "knight"
    }
    
    override func totalAttack() -> Int{
        if let unwrappedSword = sword{
            return self.attack + Int(arc4random_uniform(4)) + unwrappedSword.attack
        } else{
            return self.attack + Int(arc4random_uniform(4))
            
        }
    }
    
    override func totalDefence() -> Int{
        return self.defence 
    }
   
    override func takeShield(fighter: Fighter) { //Nismo morali praviti jer Knight nasljeduje Soldiera
        print("Knight doesn't have shield!")
    }
        
    override func takeSword(fighter: Fighter){
        
        if(self.sword == nil){  //Ako nema mac onda uzimam od viteza ili commandera, ako imam ne uzimam
            if let fighter = fighter as? Knight{ // Provera da li pripada toj klasi? // Commander nasledjuje ovu metodu, ne moramo je praviti
               if var unwrappedSword = fighter.sword{     //otpakujemo ga jer je opcioni                 //nismo provjeravali da li smo mi vitezi jer smo pravili u klasi vitez
                print("Winner takes loser's sword")
                  self.sword = unwrappedSword                      //uzimamo njegov mac
                  fighter.sword = nil                             //on gubi mac
               }
            }
        }
     }
}
