//
//  NodeViewController.swift
//  maumNote
//
//  Created by joon-ho kil on 2020/05/22.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import AsyncDisplayKit

class DetailNodeViewController: ASViewController<DetailNode> {
  
  init() {
    super.init(node: DetailNode.init())
    self.node.backgroundColor = .white
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
