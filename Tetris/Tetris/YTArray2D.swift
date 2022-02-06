//
//  Array2D.swift
//  Tetris
//
//  Created by ようへい on 2022/01/24.
//

import Foundation

class YTArray2D<T> {
  let columns: Int
  let rows: Int

  var array: Array<T?>

  init(columns: Int, rows: Int) {
    self.columns = columns
    self.rows = rows

    array = Array(repeating: nil, count: rows * columns)
  }

  subscript(columns: Int, rows: Int) -> T? {
    get {
      return array[(rows * columns) + columns]
    }
    set {
      array[(rows * columns) + columns] = newValue
    }
  }
}
