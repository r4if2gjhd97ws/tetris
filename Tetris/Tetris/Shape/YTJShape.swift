//
//  YTJShape.swift
//  Tetris
//
//  Created by ようへい on 2022/02/09.
//

import Foundation

class YTJShape: YTCommonShape {
  /*
   Orientation 0
     * | 0 |
       | 1 |
   | 3 | 2 |
   

   Orientation 90
   | 3*|
   | 2 | 1 | 0 |
   

   Orientation 180

   | 2*| 3 |
   | 1 |
   | 0 |
 
   Orientation 270
   
   | 0*| 1 | 2 |
           | 3 |
   
   * marks the row/column indicator for the shape
   
   pivots about `1`
 */

  override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
    return [
      Orientation.zero: [(1, 0), (1, 1), (1, 2), (0, 2)],
      Orientation.ninety: [(2, 1), (1, 1), (0, 1), (0, 0)],
      Orientation.oneEighty: [(0, 2), (0, 1), (0, 0), (1, 0)],
      Orientation.twoSeventy: [(0, 0), (1, 0), (2, 0), (2, 1)]
    ]
  }

  override var bottomBlocksForOrientations: [Orientation: Array<YTBlock>] {
    return [
      Orientation.zero: [blocks[thirdBlockIdx], blocks[fourthBlockIdx]],
      Orientation.ninety: [blocks[firstBlockIdx], blocks[secondBlockIdx], blocks[thirdBlockIdx]],
      Orientation.oneEighty: [blocks[firstBlockIdx], blocks[fourthBlockIdx]],
      Orientation.twoSeventy: [blocks[firstBlockIdx], blocks[secondBlockIdx], blocks[fourthBlockIdx]]
    ]
  }
}
