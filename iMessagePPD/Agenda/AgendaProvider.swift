//
//  AgendaProvider.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import Foundation
import Alamofire
import Realm

typealias AgendaProviderCompletion = (AgendaResponse?, BussinessError?) -> Void

let agenda1endpoint = "/agenda1"
let agenda2endpoint = "/agenda2"
let agenda3endpoint = "/agenda3"


class AgendaProvider: BaseProvider {
    
    func getAgenda1(completion: @escaping AgendaProviderCompletion) {
        endpoint = agenda1endpoint
        httpMethod = Network.get
        configUrlRequest()
        let request = AgendaGetRequest()
        sendRequest(request: request, completion: completion)
    }
    
    func getAgenda2(completion: @escaping AgendaProviderCompletion) {
        endpoint = agenda3endpoint
        httpMethod = Network.get
        configUrlRequest()
        let request = AgendaGetRequest()
        sendRequest(request: request, completion: completion)
    }
    
    func getAgenda3(completion: @escaping AgendaProviderCompletion) {
        endpoint = agenda3endpoint
        httpMethod = Network.get
        configUrlRequest()
        let request = AgendaGetRequest()
        sendRequest(request: request, completion: completion)
    }
    
    func createContactAgenda1(request: AgendaRequest, completion: @escaping AgendaProviderCompletion) {
        endpoint = agenda1endpoint
        httpMethod = Network.post
        configUrlRequest()
        sendRequest(request: request, completion: completion)
    }
    
    func createContactAgenda2(request: AgendaRequest, completion: @escaping AgendaProviderCompletion) {
        endpoint = agenda3endpoint
        httpMethod = Network.post
        configUrlRequest()
        sendRequest(request: request, completion: completion)
    }
    
    func createContactAgenda3(request: AgendaRequest, completion: @escaping AgendaProviderCompletion) {
        endpoint = agenda3endpoint
        httpMethod = Network.post
        configUrlRequest()
        sendRequest(request: request, completion: completion)
    }
    
}

struct AgendaGetRequest: Codable {
    
}


struct AgendaResponse: Response, Identifiable {
    let contacts: [Contact]?
    var id: UUID?
    
    enum CodingKeys: String, CodingKey {
            case id = "_id"
            case contacts = "contacts"
        }
    
}

struct AgendaRequest: Codable {
    let name: String?
    let phone: String?
}

struct Contact: Codable, Identifiable {
    let name: String?
    let phone: String?
    var id: UUID?
    
    enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name = "name"
            case phone = "phone"
        }
}
