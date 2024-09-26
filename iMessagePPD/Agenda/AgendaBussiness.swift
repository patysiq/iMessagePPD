//
//  AgendaBussiness.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import Foundation


typealias AgendaBussinessCompletion = (AgendaResponse?, BussinessError?) -> Void

class AgendaBussiness {
    
    let provider = AgendaProvider()
    
    func getAgenda1(completion: @escaping AgendaBussinessCompletion) {
        provider.getAgenda1() { result, error in
            if let error = error,
               let errorDescription = error.errorDescription {
                completion(result, BussinessError.message(errorDescription, true))
            }
        }
    }
    
    func getAgenda2( completion: @escaping AgendaBussinessCompletion) {
        provider.getAgenda2() { result, error in
            if let error = error,
               let errorDescription = error.errorDescription {
                completion(result, BussinessError.message(errorDescription, true))
            }
        }
    }
    
    func getAgenda3(completion: @escaping AgendaBussinessCompletion) {
        provider.getAgenda3() { result, error in
            if let error = error,
               let errorDescription = error.errorDescription {
                completion(result, BussinessError.message(errorDescription, true))
            }
        }
    }
    
    func createContactAgenda1(request: AgendaRequest, completion: @escaping AgendaBussinessCompletion) {
        provider.createContactAgenda1(request: request) { result, error in
            if let error = error,
               let errorDescription = error.errorDescription {
                completion(result, BussinessError.message(errorDescription, true))
            }
        }
    }
    
    func createContactAgenda2(request: AgendaRequest, completion: @escaping AgendaBussinessCompletion) {
        provider.createContactAgenda2(request: request) { result, error in
            if let error = error,
               let errorDescription = error.errorDescription {
                completion(result, BussinessError.message(errorDescription, true))
            }
        }
    }
    
    func createContactAgenda3(request: AgendaRequest, completion: @escaping AgendaBussinessCompletion) {
        provider.createContactAgenda3(request: request) { result, error in
            if let error = error,
               let errorDescription = error.errorDescription {
                completion(result, BussinessError.message(errorDescription, true))
            }
        }
    }

}
