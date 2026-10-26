//
//  PokemonListResponseDTO.swift
//  PokedexSwiftUI
//
//  Created by Adrian Flores Herrera on 10/25/26.
//

struct PokemonListResponseDTO : Decodable {
    
    let results : [PokemonListItemDTO]
}
