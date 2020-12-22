//
//  DataManager.swift
//  TableView
//
//  Created by Boris on 22.12.2020.
//

import Foundation

class DataManager {
  static let shared: DataManager = DataManager()

  // MARK: Public properties
  var persons: [Person] = []
  
  var groups: [String: [String]] = [:]

  // MARK: Private properties
  private var names: [String] = [
    "Zlatan",
    "Bojan",
    "Alessandro",
    "Antonio",
    "Bastian",
  ].shuffled()

  private var lastNames: [String] = [
    "Ibrahimovic",
    "Krkic",
    "Del Piero",
    "Cassono",
    "Schweinstager",
  ].shuffled()

  private var emails: [String] = [
    "zlatan@ibrahimovic.com",
    "bojan@krkic.com",
    "alessandro@delpiero.com",
    "antonio@cassono.com",
    "bastian@schweinstager.com",
  ].shuffled()

  private var phones: [String] = [
    "8111223131",
    "1313331456",
    "0987900654",
    "6863903327",
    "3137778342",
  ].shuffled()
  
  init() {
    makePersons()
  }
  
  // MARK: Private methods
  private func makePersons() {
    while !names.isEmpty {
      if let name = names.popLast(),
         let lastName = lastNames.popLast(),
         let email = emails.popLast(),
         let phone = phones.popLast()
         {
        let person = Person(
          name: name, lastName: lastName, email: email, phone: phone
        )
        let fullname = Person.getFullname(from: person)
        
        persons.append(person)
        groups[fullname] = [person.phone, person.email]
      }
    }
  }
}
