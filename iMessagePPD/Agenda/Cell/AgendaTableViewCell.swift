//
//  AgendaTableViewCell.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {
    
    static let cellName = "AgendaTableViewCell"
    static let cellClassName = "AgendaTableViewCell"
    
    var contact: Contact? {
        didSet {
            updateUI()
        }
    }
    
    
    @IBOutlet weak var myStackView: UIStackView!{
        didSet {
            myStackView.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = "Nome: "
        }
    }

    @IBOutlet weak var phoneLabel: UILabel!{
        didSet {
            phoneLabel.text = "Celular: "
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func updateUI() {
        
    }

}
