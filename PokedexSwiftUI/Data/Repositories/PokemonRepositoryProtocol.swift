//
//  PokemonRepositoryProtocol.swift
//  PokedexSwiftUI
//
//  Created by Adrian Flores Herrera on 10/25/26.
//

protocol PokemonRepositoryProtocol {
    
    func getPokemonList(limit : Int, offset : Int) async throws -> [Pokemon]
                
}
