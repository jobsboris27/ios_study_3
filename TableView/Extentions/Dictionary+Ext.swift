//
//  Dictionary+Ext.swift
//  TableView
//
//  Created by Boris on 22.12.2020.
//

import UIKit

extension Dictionary {
  subscript(i: Int) -> (key: Key, value: Value) {
    return self[index(startIndex, offsetBy: i)]
  }
}
