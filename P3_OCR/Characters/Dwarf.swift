//
//  Dwarf.swift
//  P3_OCR
//
//  Created by Dusan Orescanin on 30/11/2021.
//

import Foundation

// Dwarf class, heriting from Character class
class Dwarf: Character {

  init() {
    super.init(name: "Dwarf", damage: 30, life: 40, typeName: "Dwarf")
  }
}
