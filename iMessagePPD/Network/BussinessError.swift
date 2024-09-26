//
//  BussinessError.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import Foundation


enum BussinessError: Error {
    case offline
    case message(String, Bool)
    case sessionExpired
    
    var errorDescription: String? {
        switch self {
        case .offline:
            return "Você está offline, tente conectar-se a uma rede mais próxima ou em outra agenda."
        case let .message(message, _):
            return message
        default:
            return "Tempo de sessão expirado."
        }
    }
}
