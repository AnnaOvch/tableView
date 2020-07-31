//
//  MySecondTableViewCell.swift
//  tableViewHW
//
//  Created by Анна on 17.07.2020.
//  Copyright © 2020 anna. All rights reserved.
//

import UIKit

class MySecondTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    var labelTitle: String!
    
     var buttonAction: ((UITableViewCell) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.label.text = labelTitle
        self.backgroundColor = .systemPink
    }

//    @objc func btnTapped() {
//          print("btn tappec")
//          //delegate?.btnTapped(cell: self)
//          buttonAction?(self)
//      }
    
    @IBAction func buttonTapped(_ sender: Any) {
        buttonAction?(self)
    }
}
