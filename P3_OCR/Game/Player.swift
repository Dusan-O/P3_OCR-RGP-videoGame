//
//  Player.swift
//  P3_OCR
//
//  Created by Dusan Orescanin on 30/11/2021.
//

import Foundation

///2 players in the game
class Player {
    
    // MARK: - INTERNAL
    
    
    
    var isEliminated: Bool {
        !characters.contains { character in
            !character.isDead
        }
    }

    
    /// Each player have name, "Player 1" and "Player 2"
    let name: String
    
    // Array contains the characters of each team
    var characters: [Character] = []
    
    init(name: String) {
        self.name = name
    }
    
    
    /// Function shows the team of each player (name, typename, life and damages)
    func teamView() {
        print("\n\(name)'s team:")
        
        for character in characters {
            print(
                "\(character.name), \(character.typeName) (\(character.life)LF,\(character.damage)DAP)\n")
        }
    }
    
    
    /// Function creates the team of each player and shows it
    func chooseTeam() {
        let maxCharacter = 3
        
        while characters.count < maxCharacter {
            printChactersList()
            chooseCharacter()
        }
        
        teamView()
    }
    
    /// Select a character in player's own team, then the selected character is return, and will fight an opponent character
    func selectCharacter(characters: [Character], selectedCharacter: Character?) -> Character {
        var personage = Character(name: "", damage: 0, life: 0, typeName: "")
        var addition = 1
        var characterSelected = false
        var tmpCharacters = characters
        
        if let wizzardCharacter = selectedCharacter as? Wizzard {
            print("Choose one of your characters to heal with the 🧙‍♂️ Wizzard \(wizzardCharacter.name):")
            tmpCharacters = self.characters
        } else if selectedCharacter != nil {
            print("Choose and opponent character :")
        }
        
        for character in tmpCharacters {
            print("Enter \(addition) for \(character.name), \(character.typeName) \(character.isDead ? "☠️" : "👍")")
            addition += 1
        }
        
        while characterSelected == false {
            if let readline = readLine() {
                if let choice = Int(readline) {
                    if tmpCharacters.indices.contains(choice - 1) {
                        personage = tmpCharacters[choice - 1]
                        characterSelected = true
                    } else {
                        print("You must choose an opponent character between the numbers 1 and the remaining alive characters ❌ ")
                    }
                }
            }
        }
        
        return personage
    }
    
    
    
    
    
    // MARK: - PRIVATE
    
    /// Character's list and their caracteristics in the team
    /// The LP is reduced for simulation only - It can be changed whenever needed
    /// The DP is reduced for simulation only - It can be changed whenever needed
    private func printChactersList() {
        print("\nYou have \(characters.count) character(s) in your team (\(characters.count)/3)\n")
        print(
            ""
            + "\n1. Press 1 to choose the 🤺 Knight (50LP;25DP)"
            + "\n2. Press 2 to choose the 🗿 Giant (60LP;15DP)"
            + "\n3. Press 3 to choose the 🧝🏻 Dwarf (40LP;30DDP)"
            + "\n4. Press 4 to choose the 🧙‍♂️ Wizzard (60LP;15HEALS)\n"
        )
    }
    
    /// First step for each player, function creates the character (fighter, giant, dwarf, wizzard) and names it
    private func chooseCharacter() {
        if let readline = readLine() {
            if let choice = Int(readline) {
                switch choice {
                    
                case 1:
                    let knight = Knight()
                    
                    knight.namedCharacter()
                    if knight.validateCharacterName(arrayOfCharacters: self.characters) == true {
                        characters.append(knight)
                    }
                    
                case 2:
                    let giant = Giant()
                    
                    giant.namedCharacter()
                    if giant.validateCharacterName(arrayOfCharacters: self.characters) == true {
                        characters.append(giant)
                    }
                    
                case 3:
                    let dwarf = Dwarf()
                    
                    dwarf.namedCharacter()
                    if dwarf.validateCharacterName(arrayOfCharacters: self.characters) == true {
                        characters.append(dwarf)
                    }
                    
                case 4:
                    let wizzard = Wizzard()
                    
                    wizzard.namedCharacter()
                    if wizzard.validateCharacterName(arrayOfCharacters: self.characters) == true {
                        characters.append(wizzard)
                    }
                    
                default:
                    print("You made a mistake ❌ , try again\n")
                }
            }
        }
    }
    
}
