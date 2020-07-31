//
//  MyTableViewController.swift
//  tableViewHW
//
//  Created by Анна on 17.07.2020.
//  Copyright © 2020 anna. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var numberOfRows = [1,2,3,4,5]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .purple
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: CellsId.myCell.rawValue)
        self.navigationItem.title = "My table view"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(btnTapped))
        self.navigationController?.navigationBar.tintColor = UIColor.black

    }
    
    @objc func btnTapped() {
        tableView.isEditing = !tableView.isEditing
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        tableView.beginUpdates()
        numberOfRows.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
      }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfRows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyTableViewCell(backgroundColorCustom: .brown)
        //let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.myCell.rawValue) as! MySecondTableViewCell
        cell.labelTitle = String("\(indexPath.section), \(indexPath.row)")
        cell.buttonAction = { [weak self] cell in
            self?.showAlert(cell: cell)
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .green
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        showAlert(cell: cell!)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.numberOfRows[sourceIndexPath.row]
        numberOfRows.remove(at: sourceIndexPath.row)
        numberOfRows.insert(movedObject, at: destinationIndexPath.row)
    }
    
  

}
extension MyTableViewController {
    
    func showAlert(cell: UITableViewCell) {
        let indexPath = tableView.indexPath(for: cell)
        let alert = UIAlertController(title: "My alert", message: "cell \(indexPath!.section), \(indexPath!.row)", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (alert) in
            self.tableView.deselectRow(at: indexPath!, animated: false)
        }
        alert.addAction(action)
        self.present(alert,animated: true)
    }
    
    
}
