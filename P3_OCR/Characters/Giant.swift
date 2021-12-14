//
//  Giant.swift
//  P3_OCR
//
//  Created by Dusan Orescanin on 30/11/2021.
//

import Foundation

// Giant class, heriting from Character class
class Giant: Character {
    
    init() {
        super.init(name: "Giant", damage: 15, life: 60, typeName: "Giant")
    }
}
