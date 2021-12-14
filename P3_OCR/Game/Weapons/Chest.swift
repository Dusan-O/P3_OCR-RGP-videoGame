//
//  Chest.swift
//  P3_OCR
//
//  Created by Dusan Orescanin on 30/11/2021.
//

import Foundation

/// The chest will appear if the player is lucky. If the character is a wizzard, else he'll get a sword
class Chest {
    
    /// Create var Weapon that contains the box or the Sword
    let weapon: Weapon
    
    init(selectedCharacter: Character) {
        if let selectedCharacter = selectedCharacter as? Wizzard {
            print("🧙🏻‍♂️ The Wizzard \(selectedCharacter.name) receives a wand 🪄, and gears up")
            weapon = Wand()
        } else {
            print("\(selectedCharacter.name) receives a sword 🗡, and gears up")
            weapon = Sword()
        }
    }
}
