//
//  Untitled.swift
//  PokedexSwiftUI
//
//  Created by Adrian Flores Herrera on 10/25/26.
//
import Foundation

struct PokemonListItemDTO : Decodable {
    
    let name : String
    let url : String
    
}

extension PokemonListItemDTO {
    
    func toDomain() -> Pokemon {
        
        let cleanURL = url.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        let idString = cleanURL.components(separatedBy: "/").last ?? "0"
        let id = Int(idString) ?? 0
        
        let imageUrl = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")
        
        return Pokemon(
            id: id,
            name: name.capitalized,
            imageUrl: imageUrl)
        
    }
    
}
