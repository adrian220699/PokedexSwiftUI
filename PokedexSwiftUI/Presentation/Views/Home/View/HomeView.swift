//
//  ContentView.swift
//  PokedexSwiftUI
//
//  Created by Adrian Flores Herrera on 10/25/26.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel

    init(repository: PokemonRepositoryProtocol = PokemonRepository()) {
        _viewModel = State(initialValue: HomeViewModel(repository: repository))
    }
    
    // Grid adaptable de 2 columnas
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading && viewModel.pokemons.isEmpty {
                    VStack(spacing: 12) {
                        ProgressView()
                            .scaleEffect(1.5)
                        Text("Buscando Pokémon...")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                } else if let error = viewModel.errorMessage {
                    VStack(spacing: 16) {
                        Image(systemName: "wifi.exclamationmark")
                            .font(.system(size: 50))
                            .foregroundStyle(.red)
                        Text(error)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Button("Reintentar") {
                            Task {
                                await viewModel.loadPokemons()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.pokemons) { pokemon in
                                PokemonGridCard(pokemon: pokemon)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Pokédex")
            // task ejecuta el método async automáticamente cuando la vista carga en pantalla
            .task {
                await viewModel.loadPokemons()
            }
        }
    }
}

#Preview {
    HomeView()
}
