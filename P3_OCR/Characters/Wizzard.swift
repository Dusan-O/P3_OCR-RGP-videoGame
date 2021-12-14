//
//  Wizzard.swift
//  P3_OCR
//
//  Created by Dusan Orescanin on 30/11/2021.
//

import Foundation

// Wizzard class, heriting from Character class
class Wizzard: Character {
    
    // Creation heal
    let heal: Int = 10
    
    init() {
        super.init(name: "Wizzard", damage: 0, life: 60, typeName: "Wizzard")
    }
    
    // Writing the own version of the openChest, giving to the wizzard a Wand
    override func openChest(chest: Chest) {
        weapon = chest.weapon
        
        if let wand = weapon as? Wand {
            print("Thanks to my wand 🪄 , my new healing power is \(self.heal + wand.weaponHeal)")
        }
    }
    
    // The wizzard will heal the target
    override func attack(target: Character) {
        print("\(name), heals \(target.name)")
        
        if let characterWeapon = weapon as? Wand {
            target.life = target.life + (self.heal + characterWeapon.weaponHeal)
            print("\(target.name) wins \(self.heal + characterWeapon.weaponHeal)LP")
        } else {
            target.life = target.life + self.heal
            print("\(target.name) wins \(self.heal)LP")
        }
    }
}
