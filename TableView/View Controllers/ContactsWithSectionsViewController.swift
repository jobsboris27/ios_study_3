//
//  ContactsWithSectionsViewController.swift
//  TableView
//
//  Created by Boris on 22.12.2020.
//

import UIKit

class ContactsWithSectionsViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet var tableView: UITableView!

  // MARK: - Private properties
  let groups: [String: [String]] = DataManager.shared.groups

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
  }
}

// MARK: - Extentions

// MARK: - UITableViewDataSource
extension ContactsWithSectionsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return groups[section].key
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return groups[section].value.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return groups.keys.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCellWithSections", for: indexPath) as! InformationTableViewCell

    cell.iconImageView.image = indexPath.row == 0 ? UIImage(systemName: "phone") : UIImage(systemName: "tray")
    cell.labelView.text = groups[indexPath.section].value[indexPath.row]  

    return cell
  }
}
