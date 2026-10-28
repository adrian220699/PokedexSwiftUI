//
//  PokemonRepository.swift
//  PokedexSwiftUI
//
//  Created by Adrian Flores Herrera on 10/28/26.
//

import Foundation

final class PokemonRepository : PokemonRepositoryProtocol {
    
    private let session : URLSession
    
    init(session : URLSession = .shared) {
        
        self.session = session
        
    }
    
    func getPokemonList(limit: Int, offset: Int) async throws -> [Pokemon] {
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)") else {
                throw NetworkError.badURL
            }
            
            let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badServerResponse
        }
        
        // Decodificacion JSON
        
        do {
            
            let dto = try JSONDecoder().decode(PokemonListResponseDTO.self, from: data)
            return dto.results.map { dto in
                
                dto.toDomain()
            }
            
        } catch {
            throw NetworkError.decodingError
        }
        
    }
    
    func getPokemonDetail(id: Int) async throws -> Pokemon {
        
        throw NetworkError.notImplemented    }
        
}
