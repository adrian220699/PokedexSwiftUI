//
//  HomeViewModel.swift
//  PokedexSwiftUI
//
//  Created by Adrian Flores Herrera on 10/28/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class HomeViewModel {
    
    //MARK: - Estado Observable
    
    private(set) var pokemons : [Pokemon] = []
    private(set) var isLoading : Bool = false
    private(set) var errorMessage : String? = nil
    
    private let repository : PokemonRepositoryProtocol
    private var currentOffSet : Int = 0
    private let pageLimit: Int = 20
    
    //Inyección de dependencias (para facilitar los test)
    
    
    //Inicializador designado (para pruebas unitarias con Mocks)
    
    init(repository: PokemonRepositoryProtocol) {
            self.repository = repository
        }
    
    func loadPokemons() async {
        
        //Evita disparar dos llamadas si ya esta cargando una
        
        guard !isLoading else {return}
        
        isLoading = true
        errorMessage = nil
        
        do {
            
            let fetched = try await repository.getPokemonList(limit: pageLimit, offset: currentOffSet)
            self.pokemons.append(contentsOf: fetched)
            self.currentOffSet += pageLimit
            self.isLoading = false

        } catch {
            
            self.isLoading = false
            self.errorMessage = "Error al conectar con la Pokedex: \(error.localizedDescription)"
            
        }
    }
}
