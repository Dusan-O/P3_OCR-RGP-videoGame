//
//  Wand.swift
//  P3_OCR
//
//  Created by Dusan Orescanin on 30/11/2021.
//

import Foundation

// Wand for the Wizzaed if openChest())
class Wand: Weapon {
    
    // Wizzard needs to heal, let weaponHeal, and init his dommage at zero
    let weaponHeal = 20
    
    init() {
        super.init(damage: 0)
    }
}
