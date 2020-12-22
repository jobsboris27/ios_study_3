//
//  ViewController.swift
//  TableView
//
//  Created by Boris on 22.12.2020.
//

import UIKit

class ContactsViewController: UITableViewController {
  // MARK: - Private properties
  let persons: [Person] = DataManager.shared.persons

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let contactVC = segue.destination as? ContactViewController else { return }
    guard let indexPath = tableView.indexPathForSelectedRow else { return }
  
    contactVC.person = persons[indexPath.row]
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return persons.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)

    let person = persons[indexPath.row]
    cell.textLabel?.text = Person.getFullname(from: person)

    return cell
  }
}
