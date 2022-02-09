//
//  YTTshape.swift
//  Tetris
//
//  Created by ようへい on 2022/01/25.
//

import Foundation
import AppKit

class YTTShape: YTShape {
  /*
   
   Orientation: 0
   *|0|
  |1|2|3
   
   
   Orientation: 90
  *|1|
   |2|0|
   |3|
   
   Orientation: 180
    *
   |1|2|3|
     |0|
   
   Orientation: 270
    *|1|
   |0|2|
     |3|
   
   * marks the row/column indicator for the shape
   
  */

  override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
    return [
      Orientation.zero: [(1, 0), (0, 1), (1, 1), (2, 1)],
      Orientation.ninety: [(2, 1), (1, 0), (1, 1), (1, 2)],
      Orientation.oneEighty: [(1, 2), (0, 1), (1, 1), (2, 1)],
      Orientation.twoSeventy: [(0, 1), (1, 0), (1, 1), (1, 2)]
    ]
  }


  override var bottomBlocksForOrientations: [Orientation: Array<YTBlock>] {

    return [
      Orientation.zero: [blocks[secondBlockIdx], blocks[thirdBlockIdx], blocks[fourthBlockIdx]],
      Orientation.ninety: [blocks[firstBlockIdx], blocks[fourthBlockIdx]],
      Orientation.oneEighty: [blocks[firstBlockIdx], blocks[secondBlockIdx], blocks[fourthBlockIdx]],
      Orientation.twoSeventy: [blocks[firstBlockIdx], blocks[fourthBlockIdx]]
    ]
  }
}
