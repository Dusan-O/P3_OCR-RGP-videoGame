//
//  Character.swift
//  P3_OCR
//
//  Created by Dusan Orescanin on 30/11/2021.
//

import Foundation

///Character class, parent of all the Characters
class Character {
    
    ///Parameters for all characters
    var life: Int
    let damage: Int
    var name: String
    let typeName: String
    var weapon: Weapon?
    var isDead: Bool {
        life <= 0
    }
    
    init(name: String, damage: Int, life: Int, typeName: String) {
        self.name = name
        self.damage = damage
        self.life = life
        self.typeName = typeName
    }
    
    ///Choose the character name
    func namedCharacter() {
        print("\nGive a name at your \(typeName) :\n")
        
        if let characterName = readLine() {
            name = characterName
        }
    }
    
    ///Function search if the name of the character is a single
    func validateCharacterName(arrayOfCharacters: [Character]) -> Bool {
        for character in arrayOfCharacters {
            if character.name.lowercased().trimmingCharacters(in: .whitespaces) == name.lowercased().trimmingCharacters(in: .whitespaces) {
                print("You made a mistake ❌ , choose another one")
                return false
            }
        }
        
        print("\nI am a \(typeName), my name is \(name) I have \(life)LP and \(damage)DP\n")
        return true
    }
    
    ///Openning the chest and give to the character a sword
    func openChest(chest: Chest) {
        weapon = chest.weapon
        print("With my sword, my attacks points are \(damage + chest.weapon.damage)AP")
    }
    
    ///The character attack the target, we add the dammage of the sword if he have one
    func attack(target: Character) {
        print("\(name), attack \(target.name)")
        
        if let characterWeapon = weapon {
            target.life = target.life - (damage + characterWeapon.damage)
            print("\(target.name) loose \(damage + characterWeapon.damage)LP")
        } else {
            target.life = target.life - damage
            print("\(target.name) loose \(damage)LP")
        }
        
        if target.isDead {
            print("\(target.name) don't have any Life Points... He's dead ☠️ !")
        }
    }
}
