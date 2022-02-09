//
//  YTSShape.swift
//  Tetris
//
//  Created by ようへい on 2022/02/09.
//

import Foundation

class YTSShape: YTCommonShape {
  /*
   Orientation 0
   
   | 0*|
   | 1 | 2 |
       | 3 |
   
   Orientation 90
   
     * | 1 | 0 |
   | 3 | 2 |
   
   
   Orientation 180
   
   | 0*|
   | 1 | 2 |
       | 3 |
       
   
   Orientation 270
       
     * | 1 | 0 |
   | 3 | 2 |
   
   * marks the row/column indicator for the shape
   
   */

  override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {

    return [
      Orientation.zero: [(0, 0), (0, 1), (1, 1), (1, 2)],
      Orientation.ninety: [(2, 0), (1, 0), (1, 1), (0, 1)],
      Orientation.oneEighty: [(0, 0), (0, 1), (1, 1), (1, 2)],
      Orientation.twoSeventy: [(2, 0), (1, 0), (1, 1), (0, 1)]
    ]
  }

  override var bottomBlocksForOrientations: [Orientation: Array<YTBlock>] {
    return [
      Orientation.zero: [blocks[secondBlockIdx], blocks[fourthBlockIdx]],
      Orientation.ninety: [blocks[firstBlockIdx], blocks[thirdBlockIdx], blocks[fourthBlockIdx]],
      Orientation.oneEighty: [blocks[secondBlockIdx], blocks[fourthBlockIdx]],
      Orientation.twoSeventy: [blocks[firstBlockIdx], blocks[thirdBlockIdx], blocks[fourthBlockIdx]]
    ]
  }
}

