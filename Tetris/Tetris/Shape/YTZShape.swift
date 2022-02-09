//
//  YTZShape.swift
//  Tetris
//
//  Created by ようへい on 2022/02/09.
//

import Foundation

class YTZShape: YTCommonShape {

  /*
   Orientation 0

       • | 0 |
     | 2 | 1 |
     | 3 |

     Orientation 90

     | 0 | 1•|
         | 2 | 3 |

     Orientation 180

       • | 0 |
     | 2 | 1 |
     | 3 |

     Orientation 270

     | 0 | 1•|
         | 2 | 3 |


     • marks the row/column indicator for the shape
   
   */

  override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
    return [
      Orientation.zero: [(1, 0), (1, 1), (0, 1), (0, 2)],
      Orientation.ninety: [(-1, 0), (0, 0), (0, 1), (1, 1)],
      Orientation.oneEighty: [(1, 0), (1, 1), (0, 1), (0, 2)],
      Orientation.twoSeventy: [(-1, 0), (0, 0), (0, 1), (1, 1)]
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
