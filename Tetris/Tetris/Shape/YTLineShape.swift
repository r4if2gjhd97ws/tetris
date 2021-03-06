//
//  YTLineShape.swift
//  Tetris
//
//  Created by γγγΈγ on 2022/02/09.
//

import Foundation

class YTLineShape: YTCommonShape {

  /*
   Orientations 0 and 180:
   
   | 0*|
   | 1 |
   | 2 |
   | 3 |
   
   
   Orientations 90 and 270:
   
   | 0 | 1*| 2 | 3 |
   
   
   * marks the row/column indicator for the shape
   */



// Hinges about the second block
  override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
    return [
      Orientation.zero: [(0, 0), (0, 1), (0, 2), (0, 3)],
      Orientation.ninety: [(-1, 0), (0, 0), (1, 0), (2, 0)],
      Orientation.oneEighty: [(0, 0), (0, 1), (0, 2), (0, 3)],
      Orientation.twoSeventy: [(-1, 0), (0, 0), (1, 0), (2, 0)]
    ]
  }

  override var bottomBlocksForOrientations: [Orientation: Array<YTBlock>] {
    return [
      Orientation.zero: [blocks[fourthBlockIdx]],
      Orientation.ninety: blocks,
      Orientation.oneEighty: [blocks[fourthBlockIdx]],
      Orientation.twoSeventy: blocks
    ]
  }
}
