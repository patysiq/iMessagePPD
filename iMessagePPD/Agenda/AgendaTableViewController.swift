//
//  TableViewController.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import UIKit

class AgendaTableViewController: BaseViewController<AgendaPresenter>{
    
    var contacts: [Contact]?
    
    var vcTitle: String = "Agenda" {
        didSet {
            self.title = vcTitle
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = vcTitle
        if vcTitle.lowercased() == "agenda1" {
            if !presenter.getAgenda1() {
                getAlert(title: "Erro generico")
            }
        }
    }
    
    private func bindElements() {
        presenter.errorMessage.bind = { [weak self] errorMessage in
            self?.getAlert(title: errorMessage ?? "Erro generico")
        }
    }
    
    private func getAlert(message: String = "", title: String) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            
//            let alertViewController = ProfileAlertViewController()
//            alertViewController.modalPresentationStyle = .overCurrentContext
//            alertViewController.messageAlert = message
//            alertViewController.titleAlert = title
//            present(alertViewController, animated: false)
        }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgendaTableViewCell", for: indexPath)
        return cell
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

}
