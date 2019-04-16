//
//  FightController.swift
//  Borba
//
//  Created by KTIOS2 on 11/8/18.
//  Copyright © 2018 Cim. All rights reserved.
//

import Foundation

class FightController {

    func fight(firstFighter: Fighter, secondFighter: Fighter) -> Fighter {
        
        var winner: Fighter = firstFighter
        
        while(firstFighter.isAlive && secondFighter.isAlive){
           
           firstFighter.punch(fighter: secondFighter)
           print("HealthPoints of the first fighter is \(firstFighter.healthPoints) ")
           print("HealthPoints of the second fighter is \(secondFighter.healthPoints) ")
            
            if(secondFighter.isAlive){
                secondFighter.punch(fighter: firstFighter)
                print("HealthPoints of the first fighter is \(firstFighter.healthPoints) ")
                print("HealthPoints of the second fighter is \(secondFighter.healthPoints) ")
            }
        }
        
        if(firstFighter.healthPoints > secondFighter.healthPoints){
            winner = firstFighter
            winner.takeSword(fighter: secondFighter)
            winner.takeShield(fighter: secondFighter)
            
        }else{
            winner = secondFighter
            winner.takeSword(fighter: firstFighter)
            winner.takeShield(fighter: firstFighter)
        }
        
        print("\nThe winner is " + winner.name + " " + winner.surname )
        return winner
    }
}
