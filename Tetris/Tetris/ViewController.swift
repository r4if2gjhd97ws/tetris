//
//  ViewController.swift
//  Tetris
//
//  Created by ようへい on 2022/01/24.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {

  var scene: YTGameScene!

  override func viewDidLoad() {
    super.viewDidLoad()

    let skView: SKView = view as! SKView


    self.scene = YTGameScene(size: skView.bounds.size)
    self.scene.scaleMode = .aspectFill
    
    skView.presentScene(scene)
  }

  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }


}

