//
//  ViewController.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    var navifgationTitle: String = "Escolha sua Agenda"
    
    @IBOutlet weak var buttonAgenda1: UIButton! {
        didSet {
            buttonAgenda1.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var buttonAgenda2: UIButton! {
        didSet {
            buttonAgenda2.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var buttonAgenda3: UIButton! {
        didSet {
            buttonAgenda3.layer.cornerRadius = 5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = navifgationTitle
    }

    @IBAction func getAgenda1(_ sender: Any) {
        let vc = AgendaTableViewController()
        vc.vcTitle = "Agenda1"
        navigationController?.navigationBar.tintColor = .marine
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func getAgenda2(_ sender: Any) {
        let vc = AgendaTableViewController()
        vc.vcTitle = "Agenda2"
        navigationController?.navigationBar.tintColor = .marine
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func getAgenda3(_ sender: Any) {
        let vc = AgendaTableViewController()
        vc.vcTitle = "Agenda3"
        navigationController?.navigationBar.tintColor = .marine
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

