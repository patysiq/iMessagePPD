//
//  AgendaPresenter.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import Foundation

class AgendaPresenter: BasePresenter {
    
    let bussiness = AgendaBussiness()
    var agenda1 = Dinamic<[Contact]?>()
    
    func getAgenda1() -> Bool {
        bussiness.getAgenda1() { [weak self] result, error in
            if let error = error {
                self?.handleError(error: error)
                return
            }
             
            guard let result = result else {return}
            
            self?.agenda1.value = result.contacts
        }
        return true
    }
}
