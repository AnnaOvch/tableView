//
//  MyTableViewCell.swift
//  tableViewHW
//
//  Created by Анна on 17.07.2020.
//  Copyright © 2020 anna. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
  //  weak var delegate: CellProtocol?
    
    var buttonAction: ((UITableViewCell) -> ())?
    
    var labelTitle: String! {
        didSet {
            label.text = labelTitle
        }
    }
    
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("Info", for: .normal)
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
        
    }()
    
    let label: UILabel = {
        let lbl =  UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
  
    
    @objc func btnTapped() {
        buttonAction?(self)
    }
    
    init(backgroundColorCustom:UIColor?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: CellsId.myCell.rawValue)
        self.backgroundColor = backgroundColorCustom
        self.contentView.addSubview(button)
        self.contentView.addSubview(label)
        button.addTarget(self, action: #selector(btnTapped),for: .touchUpInside)
        setUpConstraints()
     }
    
    private func setUpConstraints () {
        button.rightAnchor.constraint(equalTo: self.contentView.rightAnchor , constant: -8.0).isActive = true
        button.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8.0).isActive = true
        button.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0).isActive = true
        label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8.0).isActive = true
        label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 8.0).isActive = true
    }
    
 

     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
     }

  
}
//
//protocol CellProtocol: class {
//    func btnTapped(cell: UITableViewCell)
//
//}
