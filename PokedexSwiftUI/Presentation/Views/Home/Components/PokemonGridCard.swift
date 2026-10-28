//
//  PokemonGridCard.swift
//  PokedexSwiftUI
//
//  Created by Adrian Flores Herrera on 10/28/26.
//
import SwiftUI

struct PokemonGridCard : View {
    
    let pokemon : Pokemon
    
    var body: some View {
        
        VStack(spacing : 8) {
            
            AsyncImage(url: pokemon.imageUrl) { phase in
                
                switch phase {
                    
                case .empty:
                    ProgressView()
                        .frame(height : 100)
                
                case .success(let image):
                    image.resizable()
                        .scaledToFit()
                        .frame(height: 100)
                    
                case .failure:
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 40))
                        .foregroundStyle(.secondary)
                        .frame(height: 100)
                    
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(pokemon.formattedID)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
                
            Text(pokemon.name)
                .font(.headline)
        }
        
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    PokemonGridCard(pokemon: Pokemon.mock)
}
