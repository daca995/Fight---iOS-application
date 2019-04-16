//
//  Soldier.swift
//  Borba
//
//  Created by KTIOS2 on 11/1/18.
//  Copyright © 2018 Cim. All rights reserved.
//

import Foundation

class Soldier : Human , Fighter {
    
    override init(name: String, surname: String, city: String) {
        super.init(name: name, surname: surname, city: city)
        self.pictureName = "soldier"
    }
    
    var attack : Int = 1        //Nasledjuje init od hummana ali sam morala napraviti zbog slike
    var defence : Int = 0
    
    func totalAttack() -> Int{
            return self.attack + Int(arc4random_uniform(4)) // random zbog unosenja slucajnosti u igru
    }
    
    func totalDefence() -> Int{
            return self.defence 
    }
    
    func takeSword(fighter: Fighter){
        print("Soldier doesn't have sword!")
    }
    
    func takeShield(fighter: Fighter){
        print("Soldier doesn't have shield")
    }
    
    func punch(fighter: Fighter) {
        
        if(self.isAlive){
        
            var points = self.totalAttack() - fighter.totalDefence()
    
        
            if(points < 0){
                points = 0
            }
            
            fighter.healthPoints -= points
            
            if(fighter.healthPoints <= 0){
                fighter.isAlive = false
            }
            
            print("\n" + self.name + " " + self.surname + " " + "punch" + " " + fighter.name + " " + fighter.surname)
        }
        
    }
    //  init(attack : Int, defence: Int){   // Nije potrebno jer smo prethodno inicijalizovali. Mogli smo da u init stavimo ime, prezime.. (od human-a) i pozovemo super.init
    //     self.attack = 1
    //    self.defence = 0
    

}

//Int(arc4random_uniform(4)) - za dodavanje random broja 
