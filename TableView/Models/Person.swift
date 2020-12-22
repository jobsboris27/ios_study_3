//
//  Person.swift
//  TableView
//
//  Created by Boris on 22.12.2020.
//

import Foundation

struct Person {
  var name: String
  var lastName: String
  var email: String
  var phone: String
  
  public static func getFullname(from person: Person) -> String {
    return "\(person.name) \(person.lastName)"
  }
}
