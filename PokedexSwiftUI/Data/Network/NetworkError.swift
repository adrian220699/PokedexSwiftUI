//
//  NetworkError.swift
//  PokedexSwiftUI
//
//  Created by Adrian Flores Herrera on 10/28/26.
//

import Foundation

enum NetworkError : Error , LocalizedError {
    
    case badURL
    case badServerResponse
    case decodingError
    case notImplemented
    case unknown(Error)
    
    var errorDescription: String? {
        
        switch self {
            
        case .badURL:
            return "La dirección de conexión no es valida."
            
        case .badServerResponse:
            return "No se pudo obtener respuesta del servidor de Pokémon."
        
        case .decodingError:
            return "Hubo un problema al procesar los datos recibidos."
            
        case .notImplemented:
            return "Esta funcionalidad aún no esta implementada."
        
        case .unknown(let error):
            return error.localizedDescription
        }
        
    }
}
