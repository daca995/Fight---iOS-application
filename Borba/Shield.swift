//
//  Shield.swift
//  Borba
//
//  Created by KTIOS2 on 11/1/18.
//  Copyright © 2018 Cim. All rights reserved.
//

import Foundation

class Shield {
    
    var counter = 3
    var defence : Int {
        get{
            counter -= 1
            if(counter < 0){
                return 0
            }else{
                return 1 // kada je 2,1,0 povecava se odbrana za 1
            }
        
        }
    }
    
}

