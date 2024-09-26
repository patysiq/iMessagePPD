//
//  BaseViewController.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import Foundation
import UIKit

class BaseViewController<Presenter: BasePresenter> : UITableViewController {
    
    let activityIndicator = UIActivityIndicatorView(style: .white)
    let transparentView = UIView()
    let presenter = Presenter()
    var errorMessage: String?
        
        // MARK: - Overrides
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            configActivityIndicator()
            bindElements()
        }
        
        // MARK: - Public methods
        
        func startActivityIndicator() {

            transparentView.frame = UIWindow().screen.bounds
            transparentView.backgroundColor = .black
            transparentView.alpha = 0.5
            transparentView.center = view.center
            transparentView.addSubview(activityIndicator)
            view.addSubview(transparentView)
            
            let hCenterConstraint = NSLayoutConstraint(item: activityIndicator,
                                                       attribute: .centerX,
                                                       relatedBy: .equal,
                                                       toItem: transparentView,
                                                       attribute: .centerX,
                                                       multiplier: 1,
                                                       constant: 0)
            
            let vCenterConstraint = NSLayoutConstraint(item: activityIndicator,
                                                       attribute: .centerY,
                                                       relatedBy: .equal,
                                                       toItem: transparentView,
                                                       attribute: .centerY,
                                                       multiplier: 1,
                                                       constant: 0)

            transparentView.addConstraint(hCenterConstraint)
            transparentView.addConstraint(vCenterConstraint)
            
            activityIndicator.center = transparentView.center
            
            activityIndicator.startAnimating()
        }
        
        func handleError(_ error: BussinessError) {
            switch error {
            case .offline:
                showErrorMessage(error.errorDescription ?? "")
            case .message(let errorMessage, _):
                showErrorMessage(errorMessage)
            case .sessionExpired:
                showErrorMessage("Sessão expirada")
            }
        }
        
        func stopActivityIndicator() {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            transparentView.removeFromSuperview()
        }
        
        func showErrorMessage(_ message: String, handler: ((UIAlertAction) -> Void)? = nil ) {
            stopActivityIndicator()
            if presenter.showPopup {
                let alert = UIAlertController(title: presenter.errorTitle, message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: handler)
                alert.addAction(action)
                present(alert, animated: true)
            } else {
                errorMessage = message
            }
            
        }

        // MARK: - Private methods

        private func configActivityIndicator() {
            activityIndicator.center = view.center
            activityIndicator.hidesWhenStopped = true
            
            view.addSubview(activityIndicator)
        }
        
        private func bindElements() {
            presenter.errorMessage.bind = { [weak self] message in
                guard
                    let message = message else {
                        return
                }
                self?.showErrorMessage(message)
            }
        }
       
    
}
