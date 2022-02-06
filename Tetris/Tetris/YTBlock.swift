//
//  YTBlock.swift
//  Tetris
//
//  Created by ようへい on 2022/01/24.
//

import Foundation
import SpriteKit

enum BlockColor: String, CaseIterable {
  case blue
  case orange
  case purple
  case red
  case teal
  case yellow

  static func color(_ number: Int) -> BlockColor {
    switch number {
    case 0: return .blue
    case 1: return .orange
    case 2: return .purple
    case 3: return .red
    case 4: return .teal
    case 5: return .yellow
    default: return .blue
    }
  }

  var description: String {
    return self.rawValue
  }


  static func random () -> BlockColor {
    self.color(Int(arc4random_uniform(UInt32(BlockColor.allCases.count))))
  }

}



class YTBlock {
  let color: BlockColor

  var column: Int
  var row: Int
  var sprite: SKSpriteNode?

  var spriteName: String {
    return color.rawValue
  }

  var hashValue: Int {
    return self.column ^ self.row
  }

  var description: String {
    return "\(color): [\(column), \(row)]"
  }


  init(column: Int, row: Int, color: BlockColor) {
    self.column = column
    self.row = row
    self.color = color
  }

  static func == (lhs: YTBlock, rhs: YTBlock) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
  }
}
