//
//  YTShape.swift
//  Tetris
//
//  Created by ようへい on 2022/01/24.
//

import Foundation
import OpenGL

enum Orientation: Int, CustomStringConvertible, CaseIterable {

  case zero, ninety, oneEighty, twoSeventy

  var description: String {
    switch self {
    case .zero: return "0"
    case .ninety: return "90"
    case .oneEighty: return "180"
    case .twoSeventy: return "270"
    }
  }

  static func random() -> Orientation {

    return Orientation(rawValue: Int(arc4random_uniform(UInt32(Orientation.allCases.count)))) ?? .zero
  }

  static func rotate(orientation: Orientation, clockwise: Bool) -> Orientation {
    var rotated = orientation.rawValue + (clockwise ? 1 : -1)
    if rotated > Orientation.twoSeventy.rawValue {
      rotated = Orientation.zero.rawValue
    }
    return Orientation(rawValue: rotated) ?? .zero
  }

}

let numShapeTypes = 7

let firstBlockIdx: Int = 0
let secondBlockIdx: Int = 1
let thirdBlockIdx: Int = 2
let fourthBlockIdx: Int = 3

class YTShape: Hashable, CustomStringConvertible {
  static func == (lhs: YTShape, rhs: YTShape) -> Bool {
    return lhs.row == rhs.row && lhs.column == rhs.column
  }


  let color: BlockColor
  var blocks =  Array<YTBlock>()
  var orientation: Orientation
  var column: Int
  var row: Int

  var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
    return [:]
  }

  var bottomBlocksForOrientations: [Orientation: Array<YTBlock>] {
    return [:]
  }

  var bottomBlocks: Array<YTBlock> {
    guard let bottomBlocks = bottomBlocksForOrientations[orientation] else { return [] }
    return bottomBlocks
  }


  var hashValue: Int {
    return blocks.reduce(0) { $0.hashValue ^ $1.hashValue }
  }

  var description: String {
    return "\(color) block facing \(orientation): \(blocks[firstBlockIdx]), \(blocks[secondBlockIdx]), \(blocks[thirdBlockIdx]), \(blocks[fourthBlockIdx])"
  }

  init(column: Int, row: Int, color: BlockColor, orientation: Orientation) {

    self.color = color
    self.orientation = orientation
    self.column = column
    self.row = row

    initializeBlocks()
  }

  convenience init(column: Int, row: Int) {
    self.init(column: column, row: row, color: BlockColor.random(), orientation: Orientation.random())
  }

  final func initializeBlocks() {
    guard let blockRowColumnTranslations = blockRowColumnPositions[orientation] else {
      return
    }

    blocks = blockRowColumnTranslations.map { (diff) -> YTBlock in
      return YTBlock(column: column + diff.columnDiff, row: row + diff.rowDiff, color: color)
    }
  }
}
