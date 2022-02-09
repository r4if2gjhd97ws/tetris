//
//  YTLShape.swift
//  Tetris
//
//  Created by ようへい on 2022/02/09.
//

import Foundation

class YTLShape: YTCommonShape {
  /*
 Orientation 0
 
 | 0*|
 | 1 |
 | 2 | 3 |
 
 Orientation 90
 
       *
 | 2 | 1 | 0 |
 | 3 |
 
 Orientation 180
 
 | 3 | 2*|
     | 1 |
     | 0 |
 
 Orientation 270
       * | 3 |
 | 0 | 1 | 2 |
 
 
 * marks the row/column indicator for the shape
 
 Pivots about `1`
 */

  override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
    return [
      Orientation.zero: [(0, 0), (0, 1), (0, 2), (1, 2)],
      Orientation.ninety: [(1, 1), (0, 1), (-1, 1), (-1, 2)],
      Orientation.oneEighty: [(0, 2), (0, 1), (0, 0), (-1, 0)],
      Orientation.twoSeventy: [(-1, 1), (0, 1), (1, 1), (1, 0)]
    ]
  }

  override var bottomBlocksForOrientations: [Orientation: Array<YTBlock>] {
    return [
      Orientation.zero: [blocks[thirdBlockIdx], blocks[fourthBlockIdx]],
      Orientation.ninety: [blocks[firstBlockIdx], blocks[secondBlockIdx], blocks[fourthBlockIdx]],
      Orientation.oneEighty: [blocks[firstBlockIdx], blocks[fourthBlockIdx]],
      Orientation.twoSeventy: [blocks[firstBlockIdx], blocks[secondBlockIdx], blocks[thirdBlockIdx]]
    ]
  }
}
