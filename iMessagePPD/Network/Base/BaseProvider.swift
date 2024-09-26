//
//  BaseProvider.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import Foundation
import Alamofire

typealias BaseProviderCompletion<ResponseType: Response> = (ResponseType?, BussinessError?) -> Void

class BaseProvider {
    
    var endpoint = ""
    var httpMethod = ""
    var urlRequest: URLRequest?
    
    func sendRequest<RequestType: Codable, ResponseType>(request: RequestType?, completion: @escaping BaseProviderCompletion<ResponseType>) {
        do {
            
            if httpMethod != Network.get {
                let jsonData = try JSONEncoder().encode(request)
                urlRequest?.httpBody = jsonData
                print("request body: \(String(data:jsonData, encoding: .utf8) ?? "")")
            }
            
            guard let urlRequest = urlRequest else {
                completion(nil, BussinessError.message("Não foi possível criar uma requisição", true))
                return
            }
            
            AF.request(urlRequest).validate().responseJSON { result in
                do {
                    switch result.result {
                    case .success(let json):
                        print("***** sucess: \(json)")
                        let data = try JSONSerialization.data(withJSONObject: json, options: [])
                        let response = try JSONDecoder().decode(ResponseType.self, from: data)
                        completion(response, nil)
                    case .failure(let resultError):
                        print("***** \(resultError)")
                    }
                } catch {
                    completion(nil, BussinessError.message("O servidor retornou dados inválidos", true))
                }
            }
        } catch {
            completion(nil, BussinessError.message("Ocorreu um erro inesperado.", true))
        }
    }
    
    func configUrlRequest() {
        let address = "\(Network.baseURL)\(endpoint)"
        guard let url = URL(string: address) else {return}
        
        urlRequest = URLRequest(url: url)
        urlRequest?.httpMethod = httpMethod
        urlRequest?.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
    }

}


protocol Response: Codable {

}
