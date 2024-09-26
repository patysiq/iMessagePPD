//
//  BasePresenter.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import Foundation

class BasePresenter {
    
    var showPopup = false
    var errorTitle = "Atenção!"
    var errorMessage = Dinamic<String>()
        
        required init() {
            // nothing
        }
        
        // MARK: - Public methods
        
        func showErrorMessage(_ message: String) {
            errorMessage.value = message
        }
        
        func handleError(error: BussinessError) {
            switch error {
            case .sessionExpired:
                showPopup = true
            case .message(let errorMessage, let popup):
                showPopup = popup
                showErrorMessage(errorMessage)
            case .offline:
                showPopup = true
                showErrorMessage(error.errorDescription ?? "")
            }
        }
}
