//
//  PersonDetailViewController.swift
//  TableView
//
//  Created by Boris on 22.12.2020.
//

import UIKit

class ContactViewController: UIViewController {
  // MARK: Public properties
  var person: Person!
  
  // MARK: Private properties
  private lazy var phoneLabel: UILabel = {
    let label = UILabel()
    label.text = "Phone: \(person.phone)"
    return label;
  }()
  
  private lazy var emailLabel: UILabel = {
    let label = UILabel()
    label.text = "Email: \(person.email)"
    return label;
  }()
  
  private let containerStackView: UIStackView = UIStackView()

  // MARK: Overrides methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
    
    title = Person.getFullname(from: person)
  }
  
  // MARK: Private methods
  private func configureUI() {
    view.addSubview(containerStackView)

    containerStackView.axis = .vertical
    containerStackView.distribution = .equalSpacing
    containerStackView.spacing = 10
    containerStackView.translatesAutoresizingMaskIntoConstraints = false

    containerStackView.addArrangedSubview(phoneLabel)
    containerStackView.addArrangedSubview(emailLabel)
    
    NSLayoutConstraint.activate([
      containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
      containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
    ])
  }
}
