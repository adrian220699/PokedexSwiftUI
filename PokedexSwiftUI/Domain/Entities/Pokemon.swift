//
//  Pokemon.swift
//  PokedexSwiftUI
//
//  Created by Adrian Flores Herrera on 10/25/26.
//

import Foundation

struct Pokemon : Identifiable, Equatable {
    
    let id : Int
    let name : String
    let imageUrl : URL?
    
    //Propiedad computada para la interfaz:
    
    var formattedID : String {
        String(format: "#%03d", id)
    }
    
}

// Para user en #Preview de SwiftUI

extension Pokemon {
    static let mock = Pokemon(
        id: 1,
        name: "Bulbasaur",
        imageUrl: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"))
}
