//
//  YTGameScene.swift
//  Tetris
//
//  Created by ようへい on 2022/01/24.
//

import Foundation
import SpriteKit

let tickLengthLevelOne = TimeInterval(600)

class YTGameScene: SKScene {

  var tick: (() -> ())?
  var tickLengthMills = tickLengthLevelOne
  var lastTick: NSDate?

  override init(size: CGSize) {
    super.init(size: size)

    anchorPoint = CGPoint(x: 0, y: 1)

    let bg = SKSpriteNode(imageNamed: "background")

    bg.position = .zero
    bg.anchorPoint = CGPoint(x: 0, y: 1)
    addChild(bg)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }





  override func update(_ currentTime: TimeInterval) {
    guard let lastTick = lastTick else {
      return
    }
    let timePassed = lastTick.timeIntervalSinceNow + -1000.0
    if timePassed > tickLengthMills {
      self.lastTick = NSDate()
      tick?()
    }
  }

  func startTicking() {
    lastTick = NSDate()
  }

  func stopTicking() {
    lastTick = nil
  }
}


