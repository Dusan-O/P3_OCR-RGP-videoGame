//
//  Game.swift
//  P3_OCR
//
//  Created by Dusan Orescanin on 30/11/2021.
//

import Foundation

class Game {
    
    // MARK: - INTERNAL
    
    init() {
        playerOne = Player(name: "Player 1")
        playerTwo = Player(name: "PLayer 2")
    }
    
    /// Function game launch
    func start() {
        introduce()
        setup()
        play()
    }
    
    
    
    // MARK: - PRIVATE
    
    /// Create player 1
    private var playerOne: Player
    
    /// Create Player 2
    private var playerTwo: Player
    
    private var roundNumber = 0
    
    private var isGameOver: Bool {
        playerOne.isEliminated || playerTwo.isEliminated
    }
    
   
    
    /// Function game's rules
    /// The LP is reduced for simulation only - It can be changed whenever needed
    /// The DP is reduced for simulation only - It can be changed whenever needed
    private func introduce() {
        print("โ๏ธ๐ก๐ช๐ก Welcome in the World of the World's Game ๐ก๐ช๐กโ๏ธ\n")
        print(
            "World of the World's Game is an RGP game where two player will fight in a bloody battle, the winner must kill โ ๏ธ all the opponensts players.\n"
        )
        print(
            "Before the battle, every player choose 3 hereos among the 4 availables in order to create a team of three heroes, then the Player must name them with an unique name."
        )
        print(
            "Heroes :"
            + "\n1. ๐คบ The knight: Brave warrior with 50 Life Points and attacks with 25 Dammage Points "
            + "\n2. ๐ฟ The Giant: A huge giant, tall, very strong but not that aggressive with 60 LF, 15 DP"
            + "\n3. ๐ง๐ป The Dwarf: An agile warrior, strong, stable, but less resistant and slow, 40 LP, 30 DP"
            + "\n4. ๐งโโ๏ธ The Wizard: The team's healer, 60 LF and heals with 15 Healing points per play\n")
        print(
            "Then, the players have to select a character. During the game, a surprise box ๐ will appear, a gear for your character. When geared up, the player has to choose an opponent character to attack โ๏ธ or if he selects the ๐งโโ๏ธ Wizzard, an ally character to heal ๐ฉน.\n"
        )
        print(
            "Moreover, if a character dies, if he doesn't have any life Points, he can't be saved by ๐งโโ๏ธ the Wizzard."
        )
        print(
            "If all the opponent characters are dead โ ๏ธ, he looses ๐ the game, and you win ๐, you become the ๐ emperor of the ๐ world!!.\n"
        )
        print(
            "Think strategy, be patient, pick your team with precaution and may the power of the ancestors be with you.\n"
        )
    }
    
    /// Function players creates teams
    private func setup() {
        print("\(playerOne.name) choose your team with three characters")
        playerOne.chooseTeam()
        
        print("\(playerTwo.name) choose your team with three characters")
        playerTwo.chooseTeam()
    }
    
    
    
    /// First step / loop switch the players between turns
    private func play() {
        print("\nGet your army ready, the ennemy is approaching, it's BATTLE TIME โ๏ธโ๏ธโ๏ธโ๏ธโ๏ธ !!!!!!\n")
        
        while !isGameOver {
            roundNumber += 1
            print(
                "\(playerOne.name) choose one of his characters, then an opponent character to attack โ๏ธ, or an ally to heal ๐ฉน with the ๐งโโ๏ธ Wizzard."
            )
            playerOne.teamView()
            
            let ownCharacter = playerOne.selectCharacter(
                characters: playerOne.characters, selectedCharacter: nil)
            checkChest(selectedCharacter: ownCharacter)
            
            let opponentCharacter = playerOne.selectCharacter(
                characters: playerTwo.characters, selectedCharacter: ownCharacter)
            ownCharacter.attack(target: opponentCharacter)
            
            
            if checkWinner() == true {
                break
            }
            swap(&playerOne, &playerTwo)
            
            print("The round is over, let's go to the next round")
        }
        handleEndGame()
    }
    
    /// Function checks if a Player wins (if a player don't have any more character in his Array, he lost)
    private func checkWinner() -> Bool {
        if playerTwo.isEliminated {
            print("All \(playerTwo.name)'s characters are dead โ ๏ธ")
            print("\(playerOne.name.capitalized) WINS ๐")
            
            return true
        }
        
        if playerOne.isEliminated {
            print("All \(playerOne.name)'s characters are dead โ ๏ธ")
            print("\(playerTwo.name.capitalized) WINS ๐")
            
            return true
        }
        
        return false
    }
    
    private func handleEndGame() {
            print()
            print("-----------------------------END------------------------------------")
            print("\nRound Number: \(roundNumber)")
            playerOne.teamView()
            playerTwo.teamView()
        }
    
    /// Function creates a random number. If the players are lucky, his character open the mystery with the function openChest()
    func checkChest(selectedCharacter: Character) {
        let randomNumber = Int.random(in: 0...9)
        
        if randomNumber == 0 {
            let newChest = Chest(selectedCharacter: selectedCharacter)
            selectedCharacter.openChest(chest: newChest)
        }
    }
}
